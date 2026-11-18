# Contributing to WAFio

Thank you for looking at the project. This file says how contributions work across the repositories. Each
component repository has its own `CONTRIBUTING.md` with the rules for its code.

## Where a change goes

- **Code** goes to the component repository it belongs to. The table in [README.md](README.md) says which one.
- **This repository** holds the project's front page, the community files and the platform releases. A change to
  the README, to these files or to the issue templates goes here.
- **A change that touches several parts** (a new feature in the dashboard that needs an API and agent support)
  starts with an issue here, so the parts can be planned together. A change to the protocol between the control
  plane and the agents starts in `shared/` of wafio-cp-backend, gets a `shared/vX.Y.Z` tag, and then the agents
  follow.
- **A security problem** does not go into an issue or a pull request: see [SECURITY.md](SECURITY.md).

For anything larger than a small fix, open an issue first and say what you want to change. It saves you work if the
change does not fit.

## Pull requests to this repository

- One topic per pull request.
- `scripts/ci-local.sh` passes. It checks for secrets, for files that do not belong here and for broken links
  between the files of this repository.
- Writing is plain English: short sentences, no marketing words. Say what a thing does.
- Do not commit secrets, local configuration, certificates or keys.

## Licence of your contribution

This repository is under the GNU General Public License, version 3 only ([LICENSE](LICENSE)). Before a contribution
can be merged you must agree to the Wafio Contributor Licence Agreement in [CLA.md](CLA.md). You keep your
copyright; the agreement gives Wafio the right to publish your contribution in this project and in the products built
from it. Section 5 of `CLA.md` says how to agree. The component repositories under GPL-3.0 ask for the same
agreement; uddin-lang-rs asks for a sign-off on each commit instead.

## Conduct

Everyone who takes part in the project follows the [code of conduct](CODE_OF_CONDUCT.md).

## Work done with a coding assistant

You may use a coding assistant. [AGENTS.md](AGENTS.md) holds the short form of these rules for it. The person who
opens the pull request has read the change, understands it and answers for it, and is the one who agrees to
`CLA.md`. A security report must be reproduced before it is sent: a finding that nobody ran is not a report.
