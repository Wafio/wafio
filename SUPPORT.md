# Support

| You need | Go to |
|---|---|
| To install or upgrade | <https://wafio.cloud/get-started> and <https://wafio.cloud/docs> |
| To report a bug or ask about the whole product | an issue in this repository |
| To report a bug in one part you know | the issues of that component repository (see the table in [README.md](README.md)) |
| To report a security problem | a private report, never an issue: [SECURITY.md](SECURITY.md) |
| A question about open source licences, or a request for source code | [OPEN_SOURCE_POLICY.md](OPEN_SOURCE_POLICY.md) |
| Installation, maintenance or support with a response time | <https://wafio.cloud/services> |
| Anything else | <https://wafio.cloud/support> or <hello@wafio.cloud> |

Community support in the issue trackers is given by the maintainers and other users when they can. It has no
response time.

## A good bug report

- the WAFio version (shown in the dashboard footer) and which parts you run;
- the distribution and the kernel version (`uname -r`) for the host agent;
- what you did, what you expected and what happened;
- the relevant log lines (`journalctl -u wafio`, `-u wafio-waf-agent` or `-u wafio-host-agent`).

Remove passwords, keys, tokens, cookies and personal data from logs before you post them.
