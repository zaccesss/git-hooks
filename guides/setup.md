# Setup

Nothing here needs changing before you install it. These hooks don't reference a username, a
path specific to one machine or any personal identity, they read from the commit or push being
made, not from anything hardcoded.

## Requirements

- Git
- [Git LFS](https://git-lfs.com). `post-checkout`, `post-commit`, `post-merge` and the end of
  `pre-push` hand over to `git lfs`. Each one exits with an error when `git-lfs` is not on `PATH`,
  so a missing install breaks every checkout, commit, merge and push, not only in repos that use
  LFS.

Install Git LFS for your platform, then register its filters once:

```bash
# macOS
brew install git-lfs
# Debian or Ubuntu
sudo apt install git-lfs
# Fedora
sudo dnf install git-lfs
# Windows: Git for Windows already bundles it, otherwise
winget install GitHub.GitLFS

git lfs install --skip-repo
```

> [!NOTE]
> `--skip-repo` only writes the global LFS filter config. Without it `git lfs install` also tries
> to write its own hooks into `core.hooksPath`, the folder these hooks live in.

## 1. Clone

```bash
git clone https://github.com/zaccesss/git-hooks.git ~/.git-hooks-src
```

## 2. Copy your platform's folder into an active hooks directory

macOS:

```bash
mkdir -p ~/.git-hooks
cp ~/.git-hooks-src/mac/commit-msg \
   ~/.git-hooks-src/mac/post-checkout \
   ~/.git-hooks-src/mac/post-commit \
   ~/.git-hooks-src/mac/post-merge \
   ~/.git-hooks-src/mac/pre-commit \
   ~/.git-hooks-src/mac/pre-push \
   ~/.git-hooks/
chmod +x ~/.git-hooks/*
```

Linux:

```bash
mkdir -p ~/.git-hooks
cp ~/.git-hooks-src/linux/commit-msg \
   ~/.git-hooks-src/linux/post-checkout \
   ~/.git-hooks-src/linux/post-commit \
   ~/.git-hooks-src/linux/post-merge \
   ~/.git-hooks-src/linux/pre-commit \
   ~/.git-hooks-src/linux/pre-push \
   ~/.git-hooks/
chmod +x ~/.git-hooks/*
```

Windows (Git Bash):

```bash
mkdir -p ~/.git-hooks
cp ~/.git-hooks-src/windows/commit-msg \
   ~/.git-hooks-src/windows/post-checkout \
   ~/.git-hooks-src/windows/post-commit \
   ~/.git-hooks-src/windows/post-merge \
   ~/.git-hooks-src/windows/pre-commit \
   ~/.git-hooks-src/windows/pre-push \
   ~/.git-hooks/
chmod +x ~/.git-hooks/*
```

## 3. Point Git at it, globally

```bash
git config --global core.hooksPath ~/.git-hooks
```

Every repo on the machine now runs these hooks on every commit and push, no per-repo setup.

## Verify it worked

```bash
git config --get core.hooksPath
ls ~/.git-hooks
git lfs version
```

> [!TIP]
> Confirm the path matches what you set and all 6 files are present and executable (`ls -l`
> should show `x` in the permissions). A hook silently not running is easy to miss otherwise,
> there is no error, the check just never fires.

## Updating after a change to this repo

> [!WARNING]
> Pulling the source repo does not update the active hooks directory by itself, the copy step
> has to run again. Skipping this step means the old hooks keep running with no warning that
> anything changed.

Replace `mac` with `linux` or `windows` to match your platform:

```bash
cd ~/.git-hooks-src
git pull
cp mac/commit-msg \
   mac/post-checkout \
   mac/post-commit \
   mac/post-merge \
   mac/pre-commit \
   mac/pre-push \
   ~/.git-hooks/
chmod +x ~/.git-hooks/*
```

## Next step

Once this is installed and working, see [extending.md](extending.md) to add your own rules on
top of the generic checks here.
