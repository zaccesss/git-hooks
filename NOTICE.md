# NOTICE - read this before installing

This repository contains git hooks for three separate operating systems. Each platform's
folder is fully self-contained, containing all 6 hooks with that platform's `sed`/`stat`
syntax. Only install the folder that matches your machine.

| Folder | Platform |
| --- | --- |
| `mac/` | macOS only (BSD `sed`, BSD `stat`) |
| `linux/` | Linux only (GNU `sed`, GNU `stat`) |
| `windows/` | Windows only (identical to `linux/`, Git for Windows runs hooks through its bundled MSYS2 shell) |

See [guides/setup.md](guides/setup.md) for the exact install commands per platform.

## What you must change before using these hooks

Nothing. These hooks don't reference a username, a path specific to one machine or any
personal identity. They read from the commit or push being made, not from anything
hardcoded. Install as-is, then see [guides/extending.md](guides/extending.md) when you want
to add your own rules.

## What you should be aware of

Neither list `commit-msg` and `pre-commit` check against is exhaustive. The AI-tool
signed-off-by names in `commit-msg` cover a short list of common tools and the secret patterns
in `pre-commit` cover well-known, high-confidence token shapes only. See
[guides/checks.md](guides/checks.md) for the full lists and why this is a defence-in-depth
layer, not a substitute for a real secret scanner run in CI.

> [!IMPORTANT]
> The direct-commit-to-main check warns rather than blocks, deliberately. Not every repo uses
> a branch-per-change workflow. A hard block here would be disruptive on a repo where
> committing straight to main is the accepted pattern.

> [!CAUTION]
> Every hook can be bypassed for one operation with `--no-verify`. That is intentional, not a
> bug to close, there needs to be an escape hatch for a genuine false positive. See
> [guides/checks.md](guides/checks.md) for exactly which checks this applies to.

## Licence

See [LICENSE](LICENSE) in the root of this repository.
