+++
title = "Style Guide"
author = ["Dr Ian Hocking"]
date = 2019-08-01
lastmod = 2019-09-09T14:04:25+01:00
draft = false
+++

This page exists in a Hugo Section (e.g. pages, posts) called 'Hidden'. Access
it from: <http://ianhocking.com/blog/hidden/style/>

Let's read about how to write posts in Ox-Hugo--after the jump. (This will
probably only work in the RSS.)

<!--more-->

Don't want to export a post? Use the _noexport_ tag. Otherwise, a TODO heading
marks it as a draft. Mod.


## Formatting {#formatting}

Some formatting tips:

<div class="table-caption">
  <span class="table-number">Table 1</span>:
  Org and Markdown
</div>

| Org                | Markdown                                                             | In Hugo rendered HTML                    |
|--------------------|----------------------------------------------------------------------|------------------------------------------|
| `*bold*`           | `**bold**`                                                           | **bold**                                 |
| `/italics/`        | `_italics_`                                                          | _italics_                                |
| `=monospace=`      | `` `monospace` ``                                                    | `monospace`                              |
| `~key-binding~`    | `` `key-binding` ``                                                  | `key-binding`                            |
|                    | - if `org-hugo-use-code-for-kbd` is nil [default]                    |                                          |
| `~key-binding~`    | `<kbd>key-binding</kbd>`                                             |                                          |
|                    | - if `org-hugo-use-code-for-kbd` is non-nil                          |                                          |
|                    | - Requires **CSS** to render the `<kbd>` tag as something special.   |                                          |
| `+strike-through+` | `~~strike-through~~`                                                 | ~~strike-through~~                       |
| `_underline_`      | `<span class = "underline">underline</span>`                         | <span class="underline">underline</span> |
|                    | - Requires **CSS** to render this `underline` class as an underline. |                                          |

So, for everything that might appear on a computer screen:


## Exporting {#exporting}

To export an org block:

```text
* Local variables :noexport:
# local variables:
# +org-export-directory: "projects/"
# end:
```


## Images {#images}

{{< figure src="/images/foo.png" >}}


## Source Blocks {#source-blocks}

```bash
#!/usr/bin/sh
ls ~/Dropbox
```

```emacs-lisp

  ;; Smarter C-a/C-e for both Emacs and Evil. C-a will jump to indentation.
  ;; Pressing it again will send you to the true bol. Same goes for C-e, except
  ;; it will ignore comments+trailing whitespace before jumping to eol.
  (map! :gi "C-a" #'doom/backward-to-bol-or-indent
        :gi "C-e" #'doom/forward-to-last-non-comment-or-eol
        ;; Standardizes the behavior of modified RET to match the behavior of
        ;; other editors, particularly Atom, textedit, textmate, and vscode, in
        ;; which ctrl+RET will add a new "item" below the current one and
        ;; cmd+RET (Mac) / meta+RET (elsewhere) will add a new, blank line below
        ;; the current one.
        :gni [C-return]    #'+default/newline-below
        :gni [C-S-return]  #'+default/newline-above
        (:when IS-MAC
          :gni [s-return]    #'+default/newline-below
          :gni [S-s-return]  #'+default/newline-above)
        (:unless IS-MAC
          :gni [M-return]    #'+default/newline-below
          :gni [M-S-return]  #'+default/newline-above))
```


## Equations - not working at the moment, probably my fault {#equations-not-working-at-the-moment-probably-my-fault}

If \\(a^2=b\\) and \\( b=2 \\), then the solution must be either
\\[a=+\sqrt{2}\\] or \\[ a=-\sqrt{2} \\]

\begin{equation}
\label{eq:1}
C = W\log\_{2} (1+\mathrm{SNR})
\end{equation}

\begin{equation} \label{eq:2} C = Wlog2 (1+\mathrm{SNR}) \end{equation}

<div class="equation">
  <div></div>

(x +1)/2

</div>


## Details disclosure {#details-disclosure}

<details>
<summary>
Click here to find out more
</summary>
<p class="details">

Now you know!
</p>
</details>
