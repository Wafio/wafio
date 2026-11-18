# Open source policy

This is the policy of WAFio for the open source software it uses, ships and contributes to. It is the policy of the
WAFio open source license compliance program, which follows ISO/IEC 5230 (OpenChain).

## Scope

The program covers the software WAFio supplies to others:

- the release bundles published at wafio.cloud: the control plane with the dashboard, the WAF agent with the
  engine library, and the host agent with its eBPF objects;
- the installer served at <https://wafio.cloud/install.sh>;
- the source code published in the repositories of the [Wafio organisation](https://github.com/Wafio) on GitHub.

It does not cover software that WAFio only runs for itself and does not supply to anyone, for example build tools,
test tools and the servers that host wafio.cloud.

## What we do

1. **Know what we ship.** Every release records the open source components of each bundle. Each component
   repository generates its third-party notices from its lock files (`NOTICES.txt`), and every release bundle comes
   with a software bill of materials in SPDX format (`.sbom.json`) next to it on wafio.cloud.
2. **Check licences before a component comes in.** A new dependency must be maintained, widely used, and under a
   licence that is compatible with the licence of the repository it goes into and with the official builds. Code
   copied or adapted from another project is recorded with its project, copyright holder and licence, and listed
   under "Code adapted from other projects" in the notices.
3. **Meet the obligations of each licence.** The bundles carry the licence texts and notices their components ask
   for. The eBPF objects of the host agent are under GPL-2.0, and their bundle carries their C source and the
   GPL-2.0 text. The source of the components under GPL-3.0 is public on GitHub, tagged for each release.
4. **Keep the records.** The bundles, their signatures, notices and SBOMs of every published release stay
   available, and WAFio keeps its own copy of each.
5. **Answer questions.** Anyone can ask about the open source licences of WAFio (see below), and gets an answer.
6. **Fix what is wrong.** When we find, or are told about, a case where a release does not meet a licence
   obligation, we confirm it, fix it in the next release and, where it is needed, publish a corrected release of
   the affected version.

## Contributions WAFio receives

Contributions to the repositories under GPL-3.0 need the Wafio Contributor Licence Agreement ([CLA.md](CLA.md)).
uddin-lang-rs (MIT) needs a sign-off on each commit. A contribution that brings in code from another project must
name that project, its copyright holder and its licence. [CONTRIBUTING.md](CONTRIBUTING.md) has the details.

## Contributions WAFio makes to other projects

People who work on WAFio may contribute to other open source projects on behalf of WAFio when:

- the contribution is their own work, or work WAFio owns, and holds no code of the detection engine or other
  unpublished WAFio code;
- it holds no secret, key, customer data or detail of a customer system;
- they follow the contribution rules and licence of the other project, including its contributor agreement if it
  has one.

A contribution that would publish code WAFio has not published itself needs the maintainers' approval first.

## Questions about open source licences

Write to <hello@wafio.cloud> with "Open source licensing" in the subject, or open an issue in
[Wafio/wafio](https://github.com/Wafio/wafio/issues). Please say which release or repository the question is about.
We confirm that we received the question and answer it. A request for source code that a licence entitles you to
gets the source, or the place to download it.

A security problem is not a licensing question: see [SECURITY.md](SECURITY.md).

## Review

The maintainers review this policy and the program behind it at least every 18 months, and when the way WAFio is
built or released changes. A change to this file is made by pull request to this repository.
