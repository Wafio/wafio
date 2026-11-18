# AGENTS.md

Instructions for coding assistants that work on the wafio repository. The rules for every contribution are in
`CONTRIBUTING.md`; this file is the short form.

## What this is

The front page of the WAFio project: the README, the community files (security, support, conduct, governance), the
issue templates and the platform releases. It holds no product code. The code is in the component repositories that
`README.md` lists; a code change goes there, not here.

## Commands

    scripts/ci-local.sh    # the gate: must pass before a pull request

The gate runs the secret scan, the check for files that do not belong here, and the check that every relative link
between the Markdown files points at a file that exists. Fix what it reports; do not disable a check.

## Rules

- Say only what is true of the project now. Do not add a number, a customer, a quote or a feature that is not real.
- A link to a component repository, to wafio.cloud or to a release must point at something that exists.
- Keep the tables in `README.md` and `SUPPORT.md` in step when a repository or a channel changes.

## Do not edit

- `LICENSE`, `CLA.md`.
- `GOVERNANCE.md` and `SECURITY.md` without an issue that records the maintainers' decision.

## Writing

Plain English: short sentences, no marketing words, no em dash. One topic per pull request.

## Security

Do not put a vulnerability in an issue, a pull request or a commit message. `SECURITY.md` says how to report it.

## The person, not the assistant

The person who opens the pull request has read the change, understands it and answers for it, and agrees to
`CLA.md`. `CONTRIBUTING.md`, "Work done with a coding assistant", says the same.
