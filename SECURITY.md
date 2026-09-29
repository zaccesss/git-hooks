# Security Policy

## Scope

This repository is shell hooks: `commit-msg`, `pre-commit` and `pre-push`, plus plain Git LFS
passthrough. It contains no application code, no service and no library, so the attack
surface is narrow. In scope:

- A false negative in `pre-commit`'s secret patterns that lets a real secret shape through
  undetected
- A shell injection vulnerability in how a hook handles a filename or commit message
- A check that silently fails to block what it claims to block (see
  [guides/checks.md](guides/checks.md) for what every check is supposed to catch)
- Insecure file permissions the setup instructions would leave a hook with

## Out of scope

- The secret-pattern list not catching every possible secret shape that exists, it's a
  defence-in-depth layer, not a full scanner, see [guides/checks.md](guides/checks.md)
- The direct-commit-to-main check being a warning rather than a block, that's deliberate

## Reporting a vulnerability

> [!IMPORTANT]
> Report privately, not in a public issue. Email contact@isaacadjei.me with details and
> reproduction steps. Expect an acknowledgement within a few days.
