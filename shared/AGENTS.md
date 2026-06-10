# Global Agent Guidelines

## Commit Rules

- **Repository conventions take precedence.** If the working repository has its own commit conventions — documented in AGENTS.md/CONTRIBUTING.md, or inferable from recent commit history — follow those. These global rules are fallbacks when the repo is silent on a given aspect.
- Do NOT add `Co-authored-by`, `Signed-off-by`, or any AI attribution trailers to commit messages.
- **One commit = one intent.** Split by purpose, not by file count:
  - Workflow config change → 1 commit
  - Script change → 1 commit
  - Documentation change → 1 commit
  - New file(s) → 1 commit per logical unit (related files can be grouped)
- **Revert test**: "Can this commit be reverted independently and still make sense?" If yes, it's the right size.
- **Exception**: If two changes MUST ship together (one without the other breaks the build), they belong in the same commit.
- **Prefer title-only commits.** Use a commit body only when context that cannot be inferred from the commit itself (title + diff + adjacent history) must be captured.
  - Ask the user before adding a body. Once the user pre-approves body usage (e.g., "feel free to use bodies") for the session or project, use bodies as needed without further confirmation.
- **Message language.** Match the language pattern established in the repository's commit history. If the history mixes languages, use your own judgment.
- **Message format.** Follow the format the project uses — either explicitly documented (Conventional Commits, ticket ID prefixes, emoji prefixes, etc.) or implicitly inferable from recent commits.
- When the user asks to commit, apply the above rules. If everything is genuinely one intent, a single commit is fine.

## Branch Strategy

- **Repository conventions take precedence.** If the working repository has its own branch naming conventions — documented in AGENTS.md/CONTRIBUTING.md, or inferable from existing branches — follow those. These global rules are fallbacks when the repo is silent on a given aspect.
- **Branch naming format.** Follow the naming format the project uses — either explicitly documented or implicitly inferable from existing branches (e.g., `feat/<slug>`, `fix/<slug>`, `chore/<slug>`, `<username>/<slug>`). If no pattern is detectable, default to a prefix matching the intended commit type.

## Pull Request Rules

- When creating a GitHub PR, if no specific PR format or style rules are defined, read the titles and bodies of recent PRs in the repository first and match their tone, style, and structure.
- **Korean PR body tone.** When writing the PR body in Korean, infer the sentence-ending tone (문장 어미) from the repository's recent PRs and match it. If there is no prior PR to reference, mix 해요체 and 했습니다체 so the text reads naturally.
- **No conversational context in PRs.** Write the PR title and body from the repository's perspective for future reviewers. Do NOT reference the chat session that produced the change — phrases like "사용자가 요청한", "as you asked", "per our conversation", or "the user wants" leak the AI-assistant context and don't belong in a permanent record. State *what* changed and *why* in technical/product terms, not who asked for it.
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
