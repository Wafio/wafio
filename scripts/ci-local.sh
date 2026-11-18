#!/usr/bin/env bash
# Every gate of this repository: the same steps the ci workflow runs. Runs all gates, keeps going after a failure,
# prints a summary and exits nonzero if any gate failed. Needs bash, git and gitleaks 8.30.1.
set -uo pipefail
cd "$(git rev-parse --show-toplevel)" || exit 1

failed=()
step() {
  local name=$1 start=$SECONDS
  shift
  printf '\n== %s\n' "$name"
  if "$@"; then
    printf -- '-- ok: %s (%ds)\n' "$name" $((SECONDS - start))
  else
    printf -- '-- FAILED: %s (%ds)\n' "$name" $((SECONDS - start))
    failed+=("$name")
  fi
}

# Agent instruction files other than the root AGENTS.md, and tracker or planning IDs, do not belong here. The checks
# need a git checkout (git ls-files, git grep); without one they would find nothing and pass, so the step fails.
ai_material() {
  git rev-parse --is-inside-work-tree >/dev/null 2>&1 && [ -e .git ] || { echo 'ai check: needs a git checkout' >&2; return 1; }
  # Names are written with a bracket (PORTIN[G]) so that this file does not match its own patterns.
  local ai_files='(^|/)(CLAUDE|GEMINI)\.md$|/AGENT[S]\.md$|(^|/)\.claude/|copilot-instructions|port-statu[s]|PORTIN[G]\.md'
  local ai_ids='(^|[^A-Za-z0-9_])(K-[0-9]{2,3}|[Ww]ave[- ]?[0-9]+|WP-[0-9]+|DEC-[0-9]+|FSD-[0-9]+|BR-[0-9]+|ADR-[0-9]+|OD-[0-9]+|REQ-[0-9]+)([^0-9]|$)'
  local bad='ai check: pattern self-test failed'
  # No \b (macOS git grep -E matches nothing with it) and no grep -q after a pipe (SIGPIPE under pipefail).
  [ "$(printf 'x K-%s y\n' 12 | grep -cE "$ai_ids")" = 1 ] || { echo "$bad" >&2; return 1; }
  [ "$(printf 'a/%s.md\n' AGENTS | grep -cE "$ai_files")" = 1 ] || { echo "$bad" >&2; return 1; }
  [ "$(printf '%s.md\n' AGENTS | grep -cE "$ai_files")" = 0 ] || { echo "$bad" >&2; return 1; }
  if git ls-files | grep -E "$ai_files"; then echo 'ai check: agent files tracked' >&2; return 1; fi
  if git grep -nIE "$ai_ids"; then echo 'ai check: tracker IDs in the repository' >&2; return 1; fi
}

secrets() {
  command -v gitleaks >/dev/null || { echo "gitleaks not installed (pinned to 8.30.1)"; return 1; }
  gitleaks git --redact --verbose --exit-code 1 --config .gitleaks.toml . && gitleaks dir --redact --exit-code 1 --config .gitleaks.toml .
}

# Every relative Markdown link points at a file or directory of this repository. Links to other sites are not
# fetched: a gate that depends on the network fails for reasons this repository cannot fix.
links() {
  local f target bad=0
  while IFS= read -r f; do
    while IFS= read -r target; do
      target=${target%%#*}
      [ -z "$target" ] && continue
      case $target in http://* | https://* | mailto:*) continue ;; esac
      if [ ! -e "$(dirname "$f")/$target" ]; then
        echo "broken link in $f: $target"
        bad=1
      fi
    done < <(grep -oE '\]\([^) ]+\)' "$f" | sed -E 's/^\]\(//; s/\)$//')
  done < <(git ls-files '*.md')
  return "$bad"
}

step "agent material" ai_material
step "secret scan" secrets
step "links between files" links

printf '\n== summary\n'
if [ ${#failed[@]} -gt 0 ]; then
  printf 'failed: %s\n' "${failed[@]}"
  exit 1
fi
echo "all gates passed"
