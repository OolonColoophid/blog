+++
title = "Permanently Set File-Local Variables in Doom Emacs"
author = ["Dr Ian Hocking"]
date = 2019-09-09
lastmod = 2019-09-10T10:26:45+01:00
draft = false
+++

From time to time, it's useful to set local variables within an `org`
file. For instance, I have a file whose subsections I'd like to occasionally
encrypt. This being the case, I need to turn off autosave (since this could save
plain text). To do this for the buffer, I add this to the top:

```org
# -*- buffer-auto-save-file-name: nil; -*-
```

Emacs is understandably wary of running elisp simply because it exists in the
file, however. Upon opening this buffer, it warns:

> The local variables list in [filename] contains variables that are
> risky

This is followed by a question about allowing them on this occasion only.
Globally, the level of wariness is controlled by the variable
`enable-local-variables`, whose explanation is given here: [File Local
Variables - GNU Emacs Lisp Reference Manual](https://www.gnu.org/software/emacs/manual/html%5Fnode/elisp/File-Local-Variables.html#File-Local-Variables).

I would, however, like to avoid setting this globally. I'd prefer that Emacs
adds safe
variables to a whitelist. I'd consider turning off autosave to be reasonably
safe, so the first thing I tried was adding it to the whitelist. The safe variable is called
`safe-local-variable-values` and is defined in the Emacs installation itself (i.e.
in `/usr/local`, where my Emacs installation lives).

Because I use [Doom Emacs](https://github.com/hlissner/doom-emacs), I put the following into my `./config/Doom/config.el` (which is actually tangled
from my `config.org`):

```emacs-lisp
  (add-to-list 'safe-local-variable-values '("buffer-auto-save-filename" . "nil") t)
```

But this didn't work. At first, I thought that perhaps the above elisp is running too
early, as the list when I inspected it after opening Emacs showed only the
original values (referring to variables relevant to other files). How late, I
wondered, could I make this code run? After the `org` module is loaded?[^fn:1]

```emacs-lisp
(after! org
  (add-to-list 'safe-local-variable-values '("buffer-auto-save-filename" . "nil") t)
  )
```

Still no luck.

It turns out that `safe-local-variables` was being set in
`/.config/Doom/init.el`--this should have been before my `config.el`, and yet my
`config.el` code was not modifying the variable.

Fine, I thought--I'll carefully edit the part of the `init.el` setting
`safe-local-variables`. But I still saw the same behaviour in my target file: I
was being asked, temporarily, if I wanted to permit the variable
`buffer-auto-save-file-name` to be set. Why wouldn't my method work? I wasn't
sure. But since Doom had set the variables successfully before from other `org`
files previousl, writing them to `safe-local-variables` in its own `init.el`, I
had a look at how those files set variables and I saw that it was done in a
slightly different manner:

```text
* Local variables :noexport:
# local variables:
# +org-export-directory: "projects/"
# end:
```

I tried this with my problematic file. First schoolboy error: I didn't place
it at the end of the file. This fixed, I tried again. But Emacs persisted in
prompting me to only allow setting `buffer-auto-save-filename` temporarily. Why not permanently?

I went back and looked again at the elisp in my `/.config/Doom/init.el` and
realised that I had put `NIL` in quotes. Second schoolboy error. Of course, it
shouldn't have quotes---it needs to be plain old `NIL`. The correct code in the
`.init` is thus:

```elisp
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("427fa665823299f8258d8e27c80a1481edbb8f5463a6fb2665261e9076626710" "e838d6375a73fda607820c65eb3ea1f9336be7bd9a5528c9161e10c4aa663b5b" "80365dd15f97396bdc38490390c23337063c8965c4556b8f50937e63b5e9a65c" "fe666e5ac37c2dfcf80074e88b9252c71a22b6f5d2f566df9a7aa4f9bea55ef8" default)))
 '(safe-local-variable-values
   (quote
    ((+org-export-directory . "projects/")
     (+org-export-directory . "projects/cccuWorkloadModel")
     (+org-export-dir . "projects/cccuWorkloadModel")
     (buffer-auto-save-file-name . nil)))))
```

[^fn:1]: The `after! org` is a Doom wrapper function that ensures the elisp codes that follows is evaluated after a given module is loaded.
