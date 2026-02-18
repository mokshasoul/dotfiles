# Dotfiles

<!--toc:start-->

- [Dotfiles](#dotfiles)
  - [Overview](#overview)
  - [Chezmoi Conventions](#chezmoi-conventions)
    - [File naming](#file-naming)
  - [Key files](#key-files)
  - [Guidelines](#guidelines)
    - [Configuration Management](#configuration-management)
    - [Making Changes](#making-changes)
    - [Best Practices](#best-practices)
  - [Development Workflow](#development-workflow)
  - [Questions?](#questions)
  <!--toc:end-->

This document provides context and instructions for AI coding agents working with this repository.

## Overview

This is a **personal dotfiles repository** for macOS and Linux, managed with [chezmoi](https://chezmoi.io).

It contains configuration files, shell scripts, and automation for setting up and maintaining a development environment.

## Chezmoi Conventions

### File naming

- Files prefixed with `dot_` become dotfiles (e.g., `dot_gitconfig` → `.gitconfig`)
- Files prefixed with `private_dot_` become dotfiles with restricted permissions
- Files prefixed with `empty_` create empty files
- Files prefixed with `executable_` become executable scripts
- Templates use `.tmpl` extension and support Go templating
- `run_once_` prefix: scripts that run once during chezmoi apply
- `run_onchange_` prefix: scripts that run when their content changes
- `run_once_after_`: runs after other scripts
- `run_once_before_`: runs before other scripts

## Key files

- `.chezmoi.toml.tmpl`: Chezmoi configuration
- `.chezmoiignore`: Files to ignore by chezmoi

## Guidelines

Always update your knowledge on the most recent meta for all the languages defined here:

- `fish`
- `bash`
- `lua`
- `toml`

If available follow googles style guides for these languages, but never add comments to the code.

### Configuration Management

- **Nix Darwin**: This is not used anymore, but was previously used only on work machine (`soundcloud-mbp`) via `private_dot_config/nix-darwin/flake.nix`
- **Fish Shell**: Primary shell with extensive customization in `private_dot_config/private_fish/`
- **Neovim**: LazyVim-based configuration in `private_dot_config/nvim/`
- **Tmux**: Customized with plugins and catppuccin theme
- **Hammerspoon**: Lua-based macOS automation scripts
- _Wezterm_: Used to be the ond terminal we used, but now using _Ghostty_
- _Ghostty_: Primary terminal configuration under `private_dot_config/ghostty/`

### Theme System

- Uses **Catppuccin Latte** theme consistently across all applications for light mode
- Uses **Catppuccin Mocha** theme consistently across all applications for light mode
- Theme switching function available via fish shell (`update_theme`)
- Always coordinate theming to take account of light and dark modes
  for any application we are using. If not possible prefer light mode

### Git Configuration

- Uses commitizen with cz-git for conventional commits
- Run `git cz` or `npx cz` for guided commit creation
- Different configs for work and home machine

### Fish Development Tools

- **fish-lsp** - Language server for fish shell validation and IDE support
  - Installed via Homebrew: `/opt/homebrew/bin/fish-lsp`
  - Configured in Neovim LSP: `/private_dot_config/nvim/lua/plugins/lsp.lua`
  - Provides syntax checking, completion, and validation for fish files

### Making Changes

1. **Template Files**: When editing `.tmpl` files, preserve Go template syntax (e.g., `{{ .chezmoi.* }}`)
1. **Shell Scripts**: Follow existing shell script conventions (fish & bash shell)
1. \*_Environment Updates_: When we add paths to fish ensure that we
   update the relevant files for `bash` and `zsh` to make those
   tools available under those shell environments.
1. **Testing**: Use `chezmoi diff` to preview changes before applying
1. **Validation**: Run `chezmoi apply --dry-run` to test changes
1. **Applying changes**: Never actually apply chezmoi changes to local dotfiles

### Best Practices

- **Preserve existing structure**: Don't reorganize files \*without explicit request
- **Maintain compatibility**: Changes should work on macOS and Unix systems
- **Template variables**: Use chezmoi template variables when appropriate
- **Idempotency**: Scripts should be safe to run multiple times
- **Error handling**: Fail gracefully when writing scripts
- **Comments**: Never add comments

## Development Workflow

When helping with this repository:

1. **Understand the change**: Know if it's a config, script, or template
2. **Locate the correct file**: Use chezmoi naming conventions
3. **Preserve templates**: Keep `{{ }}` syntax intact
4. **Test safely**: Use `--dry-run` flagsw
5. **TODO Lists**: Create task specific TODO lists for any larger changes to
   ensure all steps are covered in the directory `.agents/todo/`

## Questions?

- [Chezmoi.io docs](https://chezmoi.io)
- [fish shell docs](https://fishshell.com/docs/current/index.html)
