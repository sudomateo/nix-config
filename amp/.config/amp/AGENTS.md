# Matthew Sanabria's AI Agent Context

## Code Style

* Prefer lines to be 80 characters or fewer when possible.
* Always respect language-specific formatters (e.g., `go fmt`, `cargo fmt`,
  `prettier`) even if they exceed 80 characters.

## Committing Code

Use `jj` (Jujutsu) instead of `git` for version control actions. Here's a table
showing how popular `git` commands translate into `jj`.

| Use Case                                                  | Git Command               | Jujutsu Command     |
| --------------------------------------------------------- | ------------------------- | ------------------- |
| Finish work on the current change and start a new change. | `git commit -a`           | `jj commit`         | 
| Check out a named revision, or branch, to examine source. | `git checkout <revision>` | `jj new <revision>` | 
| Show working copy status.                                 | `git status`              | `jj st`             | 
| Show diff of the current change.                          | `git diff`                | `jj diff`           |
| Show log graph of the current commit.                     | `git log`                 | `jj log`            |
| List branches (i.e., bookmarks).                          | `git branch`              | `jj bookmark`       |
| Edit commit message of the working copy change.           | N/A                       | `jj describe`       |
| Edit commit message of the parent change.                 | `git commit --amend`      | `jj describe @-`    |
| Squash changes into the parent revision.                  | `git rebase -i`           | `jj squash`         |
| Push to a remote repository.                              | `git push`                | `jj git push`       |
| Discard a change.                                         | `git reset --hard`        | `jj abandon`        |

### Commit Message

Commit messages must use the following format.

```
${type}: ${description}

${body}

${footer}
Amp-Thread: ${amp_thread_url}
Co-authored-by: Amp <amp@ampcode.com>
```

In this format:

* `${type}` is a conventional commit type (e.g., `fix`, `feat`, `docs`, `chore`).
* `${description}` is a brief description less than 80 characters. All lowercase.
* `${body}` is text summarizing the change. Keep things concise and don't put
trivial changes in the text, readers can see the diff for the actual changes.
Keep in mind the reader will be a human.
* `${footer}` is zero or more footers (e.g., `Co-authored-by: FirstName LastName
<firstname.lastname@example.com>`).
