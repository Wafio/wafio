# Security

This policy covers all of WAFio: the control plane, the dashboard, the WAF agent, the host agent, the uddin
interpreter, the installer and the official builds downloaded from wafio.cloud.

## Report a vulnerability

Do not open a public issue, pull request or discussion for a security problem.

Report it privately on GitHub: the Security tab of this repository, then "Report a vulnerability"
(<https://github.com/Wafio/wafio/security/advisories/new>). Each component repository has the same form; use the one
of the part you found the problem in if you know it. Only the maintainers can read what you send there. If you cannot
use GitHub, write to <hello@wafio.cloud> with "Security" in the subject and we will move the report to a private
advisory.

Please include:

- what is affected: the component, the version (shown in the dashboard footer and in the bundle name) or the commit;
- what an attacker can do, and what they need first (an account, network access, a role);
- how to reproduce it: a request, a configuration or a short script.

A request that the WAF agent should have blocked and did not is a report for this channel too. Send the request and
what you expected, not a list of payloads that nobody ran.

## What happens next

1. We confirm that we received the report.
2. We try to reproduce it and tell you whether we can.
3. We fix it in the supported versions and publish a release, with a GitHub security advisory and, where it applies,
   a CVE identifier requested through GitHub.
4. We credit you in the advisory, unless you ask us not to.

Please give us the chance to release a fix before you publish details. Tell us if you have a date in mind, and we
will agree on one with you.

## Supported versions

Security fixes go into the latest release and into `main` of each repository. Upgrade with the installer
(`curl -fsSL https://wafio.cloud/install.sh | sudo bash`) to get them. Releases are listed at
<https://github.com/Wafio/wafio/releases>.

## Verifying what you install

Every release bundle has an Ed25519 signature and an SBOM next to it on wafio.cloud. The installer checks the
SHA-256 from the signed manifest and the signature of each bundle, and stops when either does not match.
