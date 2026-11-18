# Governance

## Who maintains WAFio

WAFio is maintained by Wafio, the owner of the [Wafio organisation](https://github.com/Wafio) on GitHub. The
maintainers are the members of the organisation with write access to the repositories. They review and merge
changes, decide what goes into a release, and handle security reports.

## How decisions are made

- A change to one component is decided in its pull request, by the maintainers of that repository.
- A change that touches several components, the protocol between them, the release process or the licences is
  discussed in an issue in this repository first. The maintainers decide, and the issue records the decision.
- Anyone can propose a change in an issue. The maintainers answer with a decision and the reason for it.

## Branches and reviews

- `main` of every public repository is protected: a change lands through a pull request, and the repository's gate
  (`scripts/ci-local.sh`, run by the `gate` workflow) must pass.
- Force pushes to `main` and its deletion are not allowed, also for administrators.

## Releases

- A WAFio version is released for all parts together and follows semantic versioning: `vMAJOR.MINOR.PATCH`. A
  minor version adds features and keeps upgrades from the previous minor version working; a patch version fixes
  bugs only.
- Each release is tagged with the same version in every component repository, and named in the
  [releases of this repository](https://github.com/Wafio/wafio/releases). The notes of a version are in
  `docs/releases/` of wafio-cp-backend.
- The release bundles are signed with the WAFio release key, published at wafio.cloud, and checked by the installer.

## Support of versions

Fixes, security fixes included, go into the latest release and into `main`. See [SECURITY.md](SECURITY.md).

## Licences and contributions

The licences are listed in [README.md](README.md). Contributions to the repositories under GPL-3.0 need the
contributor licence agreement in [CLA.md](CLA.md); uddin-lang-rs needs a sign-off on each commit. A change of a
licence is a decision of the maintainers, announced in this repository before it takes effect.

## Changing this document

A change to this file is made by pull request to this repository and merged by a maintainer.
