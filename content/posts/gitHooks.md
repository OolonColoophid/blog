+++
title = "Using Git Hooks to Automate Blog Publishing"
author = ["Dr Ian Hocking"]
date = 2019-09-10
lastmod = 2019-09-10T17:35:28+01:00
tags = ["git"]
draft = false
+++

## Background {#background}

This blog is produced from a plaintext [Org mode](https://orgmode.org/) file
that is passed to an `org` module called
[ox-hugo](https://ox-hugo.scripter.co/). Essentially, `ox-hugo` looks at the
`org` file and produces
[Markdown](https://daringfireball.net/projects/markdown/) files, which are then
processed by a static website generation framework called
[Hugo](https://gohugo.io/getting-started/). It goes without saying that these
are all fantastic, free tools.


## My Prior Workflow {#my-prior-workflow}

Originally, when ready to publish the blog, I would save the `org` file[^fn:1]--this would trigger
an export process[^fn:2] that produced the Markdown files. This would result in a
Hugo-friendly set of files that Hugo could then chew through to produce a
complete static website. I put together this workflow based largely on this
great post from Peter Cheng,
[Publishing a Website from Emacs
and Hugo](http://petercheng.net/posts/website-v2-setup/).

The Bash script to render and upload the site looks like this:

<a id="code-snippet--deploy.sh"></a>
```bash
#!/usr/bin/env bash

# Sync /public (containing finalised HTML and resources)
# to webserver (e.g. ianhocking.com)

# e - exit if command exits with error
# u - treat unset variables as an error
set -eu

username="username"
server="servername"

blogDir="/Users/ianuser/Dropbox/org/blog/programmer"

# Remove previous build of site
rm -r "$blogDir/public" || echo "No /public directory in blog directory $blogDir to delete"

# Build
cd $blogDir && hugo || echo "Cannot cd to blog directory $blogDir"

# Upload
rsync -r --verbose --compress --human-readable --progress --recursive public/. $username@$server:public_html/blog/
```

<div class="src-block-caption">
  <span class="src-block-number"><a href="#code-snippet--deploy.sh">Code Snippet 1</a></span>:
  Contents of the file <code>deploy.sh</code>
</div>


## Why the Change? {#why-the-change}

Until yesterday, the [Git](https://git-scm.com/)[^fn:3] repository containing
the source of my site was private, but I decided that I wanted to put into the
`ox-hugo` [showcase](https://ox-hugo.scripter.co/doc/examples/), so now it's
available on Github [here](https://github.com/OolonColoophid/blog).


## Git Hooks {#git-hooks}

Git allows `hooks`, which are simply scripts run by Git[^fn:4]. You can find a
fuller explanation of them in various places.
[Automate
Your Workflow with Git Hooks](https://hackernoon.com/automate-your-workflow-with-git-hooks-fef5d9b2a58c) is a good one.

Essentially, with the directory holding your tracked files, you'll see
`.git/hooks`. Inside that, there are the hooks themselves.

Let's take a look at them.

```bash
ls -g ~/Dropbox/org/blog/programmer/.git/hooks
```

Gives us:

```text
applypatch-msg.sample
commit-msg.sample
copy_of_post-update
fsmonitor-watchman.sample
post-commit
post-update
pre-applypatch.sample
pre-commit.sample
pre-push
pre-push.sample
pre-rebase.sample
pre-receive.sample
prepare-commit-msg.sample
resources
update.sample
```

Some of these hooks are designed to be run by Git on a server (i.e.
receiving updates) and others locally (i.e. when sending). The details of which
hook suits which end of the process are provided by [Git - githooks Documentation](https://git-scm.com/docs/githooks).

The two hooks I'm interested in are `post-commit` and `pre-push`. In the
directory listing above, you can see that both of these have the suffix
`.sample` removed; that means that Git will pay attention to them. Additionally,
to make sure that the hooks execute (which are simple Bash scripts after all), we need to
make sure that execution privileges have been assigned:

```bash
chmod +x ls ~/Dropbox/org/blog/programmer/.git/hooks/post-commit
chmod +x ls ~/Dropbox/org/blog/programmer/.git/hooks/pre-push
```


## My New Workflow {#my-new-workflow}

When I commit a change to the repository, I'd like `git commit` to run the hook
[post-commit](#code-snippet--gitPost). This hook will itself call `git push`, which will notice the
[pre-push](#code-snippet--gitPre) hook and then run [my deployment script](#code-snippet--deploy.sh).

It's vitally important that the deployment script itself doesn't make changes to
the working tree, or we'll end up in a situation where Git branches diverge--a
difficult error to troubleshoot. For this reason, my `.gitignore` excludes:
`content/`, `public` and `logs`.
~

<a id="code-snippet--gitPost"></a>
```sh
#!/bin/sh

{ echo '-- ' &&
	date &&
	echo 'Git hook .git/hooks/post-commit executed by git-commit' &&
	echo 'Hook will push master branch to remote origin' ; } >> /Users/ianuser/Dropbox/org/blog/programmer/logs/hooks.log

git push origin master
```

<div class="src-block-caption">
  <span class="src-block-number"><a href="#code-snippet--gitPost">Code Snippet 2</a></span>:
  .git/hooks/post-commit
</div>

<a id="code-snippet--gitPre"></a>
```sh
#!/bin/sh

{ echo '-- ' &&
	date &&
	echo 'Git hook .git/hooks/pre-push executed by git-push' &&
	echo 'Hook will call deploy.sh' ; } >> /Users/ianuser/Dropbox/org/blog/programmer/logs/hooks.log

/Users/ianuser/Dropbox/org/blog/programmer/deploy.sh
```

<div class="src-block-caption">
  <span class="src-block-number"><a href="#code-snippet--gitPre">Code Snippet 3</a></span>:
  .git/hooks/pre-push
</div>

Finally, I'm now able
to make a commit--this will get pushed to my [Github repository](https://github.com/OolonColoophid), the site built,
an the site uploaded to [ianhocking.com](http://ianhocking.com).

[^fn:1]: Or 'write the buffer to disk' in Emacs-speak.
[^fn:2]: This is set with the variable `org-hugo-auto-export-mode` in a dotfile in the blog directory (`.dirs-locals.el`).
[^fn:3]: Git is a system for tracking file changes.
[^fn:4]: Actually, any number of subcommands.
