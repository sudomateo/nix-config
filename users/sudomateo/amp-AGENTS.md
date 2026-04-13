# Matthew Sanabria's AI Agent Context

## Code Style

* Prefer lines to be 80 characters or fewer when possible.
* Always respect language-specific formatters (e.g., `go fmt`, `cargo fmt`,
  `prettier`) even if they exceed 80 characters.

## Version Control

Use `jj` (Jujutsu) instead of `git` for version control actions (e.g.,
committing code.)

## Commit Messages

Commit messages must use the following format.

```
${type}: ${description}

${body}

Amp-Thread: ${amp_thread_url}
```

In this format:

* `${type}` is a conventional commit type (e.g., `fix`, `feat`, `docs`, `chore`).
* `${description}` is a brief description less than 80 characters. All lowercase.
* `${body}` is text summarizing the change. Keep things concise and don't put
trivial changes in the text, readers can see the diff for the actual changes.
Keep in mind the reader will be a human.
* `${amp_thread_url}` is the Amp thread URL that was used to commit the changes.
