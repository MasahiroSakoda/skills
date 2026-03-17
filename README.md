# Skills

A collection of [Skills](https://agentskills.io/): Personal agentic workflows library

## Table of Contents

- [Installation](#installation)
- [Available Skills](#available-skills)
- [License](#license)

## Installation

### All skills

```bash
npx skills add MasahiroSakoda/skills --all
```

### Specific skill

```bash
npx skills add MasahiroSakoda/skills --skill <skill_name>
```

### Target specific agent

```bash
npx skills add MasahiroSakoda/skills -a claude -a codex
```

## Available Skills

<!-- SKILLS_START -->
| Skill | Description |
| :---- | :---------- |
| [chezmoi](skills/chezmoi) |  Manage dotfiles with chezmoi. Use when working with chezmoi config, setup, or repo structure, managing files, templates, or script's (Go template syntax, run_once_/run_onchange_ scripts, .chezmoidata), handling file attributes (symlinks, permissions, encryption, external sources), Troubleshooting chezmoi operations or understanding application order. |
| [git-changelog](skills/git-changelog) | Generate changelog from current branch changes. Use when the user asks to write a changelog entry, fill the changelog section of a PR, or determine if changes are user-facing. |
| [git-commit](skills/git-commit) | Generate conventional commit message from staged changes. Use when asked to commit, stage and commit, save changes, or after completing implementation tasks. |

<!-- SKILLS_END -->

## License

Skills is released under the [MIT license](LICENSE)
