# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Hugo static site for Ian Hocking's programming blog, hosted at ianhocking.com/prog. The site uses the hugo-coder theme with local modifications.

## Essential Commands

### Development
```bash
hugo server           # Run local development server
hugo                  # Build site to /public directory
```

### Deployment
```bash
./deploy.sh          # Full deployment: clean, build, and rsync to server
```

**Important**: The deploy script:
- Removes the existing `public/` directory
- Builds the site with Hugo
- Syncs to `ianhocking.com@ssh.gb.stackcp.com:public_html/prog/`
- Logs operations to `logs/hooks.log`
- Shows macOS notification on successful upload

## Architecture

### Site Structure
- **content/**: Markdown content organized by type
  - `posts/`: Blog posts
  - `pages/`: Static pages
  - `meta/`: Meta information pages
  - `hidden/`: Non-public content
- **layouts/**: Custom layout overrides (see below)
- **static/**: Static assets (images, etc.)
- **themes/hugo-coder/**: Modified theme (DO NOT push changes upstream)
- **config.toml**: Hugo site configuration

### Theme Modifications

**Critical**: The hugo-coder theme has been modified locally. Do NOT push changes back to the original theme repository.

Custom layout overrides exist in:
- `layouts/_default/baseof.html`: Base template override
- `layouts/partials/header.html`: Custom header
- `layouts/partials/posts/`: Post-specific partials

### Content Workflow

**Critical**: All blog content is authored in `allPosts.org` (org-mode) and exported via ox-hugo to generate the markdown files in `content/`.

**NEVER edit markdown files in `content/` directly** - always edit `allPosts.org` instead. Direct edits to markdown will be overwritten on the next org export.

### Content Format

Blog posts use Hugo front matter in TOML format:
```toml
+++
title = "Post Title"
author = ["Dr Ian Hocking"]
date = 2023-01-08
lastmod = 2023-01-08T11:05:32+00:00
tags = ["AI", "ML"]
draft = false
+++
```

## Configuration Notes

- **Base URL**: `//ianhocking.com/prog` (protocol-relative)
- **Syntax highlighting**: Uses Pygments with "trac" style
- **Math support**: Enabled via `math = true`
- **Comments**: Disqus integration (shortname: "ianhocking")
- **Pagination**: 20 items per page
