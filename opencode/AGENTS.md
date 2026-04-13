# Global Agent Guidelines

## Commit Rules

- Do NOT add `Co-authored-by`, `Signed-off-by`, or any AI attribution trailers to commit messages.
- **One commit = one intent.** Split by purpose, not by file count:
  - Workflow config change → 1 commit
  - Script change → 1 commit
  - Documentation change → 1 commit
  - New file(s) → 1 commit per logical unit (related files can be grouped)
- **Revert test**: "Can this commit be reverted independently and still make sense?" If yes, it's the right size.
- **Exception**: If two changes MUST ship together (one without the other breaks the build), they belong in the same commit.
- When the user asks to commit, apply the above rules. If everything is genuinely one intent, a single commit is fine.

## Pull Request Rules

- When creating a GitHub PR, if no specific PR format or style rules are defined, read the titles and bodies of recent PRs in the repository first and match their tone, style, and structure.
- Always show the PR title and body to the user for feedback BEFORE actually creating the PR.

## Dependency Management

- When installing named packages (e.g., storybook, vite, panda css, etc.), always check the latest stable version first with `npm view <package> version` and assume it's usable unless there's a specific compatibility constraint.
- Verify peer dependency compatibility between packages before installing.

## Image Safety

- LLM image processing crashes the session irreversibly when any dimension exceeds 8,000px. **Always check dimensions before reading an image, and find a smaller alternative if it exceeds the limit.**
- Local files: use `sips --getProperty pixelWidth --getProperty pixelHeight <file>` to check dimensions (macOS built-in, does not load the image)
- URL/remote images: download first and check with sips, or use scale/resize parameters if the API supports them
- Figma: read node size from `absoluteBoundingBox` and apply `min(4, floor(8000 / max(w,h) * 100) / 100)` scale
- **Never read an image exceeding 8,000px without checking dimensions first.**
