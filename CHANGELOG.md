# Changelog

All notable changes to this project are recorded here.

Format follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).
Versioning follows [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [Unreleased]

### Fixed

- Git LFS is now listed as a requirement in the README and `guides/setup.md`, with install
  commands per platform and `git lfs version` in the verify step, since four hooks fail without
  it.

### Added

- Initial release: `commit-msg`, `pre-commit`, `pre-push`, `post-checkout`, `post-commit` and
  `post-merge`, split into self-contained `mac/`, `linux/` and `windows/` folders
- `commit-msg`: subject-line length check, blocks over 72 characters
- `pre-commit`: known secret patterns across cloud providers, source control, payments and
  messaging providers, a large-file guard (warn at 10MB, block at 50MB unless tracked
  by Git LFS), an `.env`-pattern file guard and a warning, not a block, on committing directly
  to `main`/`master`
- `pre-push`: blocks a force-push that would rewrite `main`/`master`'s history, ahead of the
  existing Git LFS passthrough
- A documented extension point in every hook, plus [guides/extending.md](guides/extending.md),
  for adding project or personal rules on top of the generic checks here

### Changed

- Tidied code comments and the contributor guide.
