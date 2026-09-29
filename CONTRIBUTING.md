# Contributing

Thanks for taking an interest. Contributions are welcome: bug fixes, platform corrections and
missing secret patterns.

## What belongs here

- A bug in an existing check (a pattern that misfires, a `sed`/`stat` incompatibility on a
  platform, a check that blocks something it shouldn't)
- A genuinely common secret pattern missing from `pre-commit`
- Corrections for a platform difference that is wrong
- Improvements to the extension-point documentation in [guides/extending.md](guides/extending.md)

## What does not belong here

- A check that reflects one contributor's personal preference rather than something broadly
  useful, that belongs in the extension point on your own machine instead, see
  [guides/extending.md](guides/extending.md)
- Making a warning into a hard block or a block into a warning without discussing it first,
  that is a deliberate design choice per check, documented in [guides/checks.md](guides/checks.md)

## How to contribute

1. Fork the repository and create a branch named `fix/<short-description>` or
   `feat/<short-description>`.
2. Make your change. If it is a check present in more than one platform folder (most of them
   are), update every platform's copy, not just one.
3. Syntax-check before opening a pull request:

   ```bash
   sh -n mac/commit-msg
   sh -n mac/pre-commit
   ```

4. If you're adding or changing a check, test it actually fires and actually verifies
   correctly.

   > [!TIP]
   > See [guides/checks.md](guides/checks.md) for the existing check-and-verify pattern every
   > fix follows, block after a failed fix rather than letting something half-fixed through.

5. Open a pull request with a clear title and a one-paragraph description of what changed and
   why.

## Style rules

> [!IMPORTANT]
> - **Comments**: explain the why, not the what.
> - **ASCII only** in code.
> - **UK English** in prose comments and documentation.
> - **No secrets**, obviously, given what this repo is for.

## Reporting bugs

Open an issue with which platform, which hook, what you expected versus what happened and the
actual output.

More about me and my work: [isaacadjei.me](https://isaacadjei.me).
