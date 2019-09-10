+++
title = "Blogging with Emacs, Hugo and Org Mode"
author = ["Dr Ian Hocking"]
date = 2019-09-01
tags = ["setup"]
draft = true
+++

This blog is brand--not to say spanking--new. For a while, this summer, I was in
the process of transitioning out of my current role (a story another time), I
was thinking about updating my web presence. Not that I don't have one. I've
been on the [the Twitter](https://twitter.com/ian%5Fhocking?lang=en-gb) and Facebook for a long old time, and my blog dates back
to [2003](http://ianhocking.com/2003/02/heres-email-from-my-dad-that-i-just.html). But my online identity focused mainly my fiction writing. I want to change its
focus to coding, which, I hope, is the direction in which I'm now
heading.

Like James May in [the Reassembler](https://www.youtube.com/watch?v=77BG4qkviWc), I want to slowly take this blog apart and put
it back together again.

My first tool is [Emacs](https://www.gnu.org/software/emacs/)[^fn:1], free software dating from the 1970s. I came to
Emacs from [Vim](https://www.vim.org). I've written elsewhere about my preference for text-based (i.e.
non-GUI) tools, and I have an idea for a post to this blog where I talk about my
current Emacs setup.

Next is a static website generation framework called [Hugo](https://gohugo.io). A key aim of the Hugo
project is that sites are pre-compiled. The server need only offer HTML, and
very little in-the-moment calculation happens on the server or the browser. This
means small, fast websites. Hugo has an active theming community, too. It never
ceases to amaze me that folks around the world are willing to offer their time
to such projects--not just the themes, of course, but the Hugo project itself.

Last, I'll be leaning heavily on [org-mode](https://orgmode.org), a part of Emacs that started as a
fancy outlining framework but became a wonderful system for storing, organising
and exporting information. Contributors have created adjuncts to org-mode, and
one such is ox-hugo[^fn:2]


## Org Mode Blogging Solutions {#org-mode-blogging-solutions}


## Emacs {#emacs}

-   Auto export


## Org Mode {#org-mode}

-   Literate coding


## Static Speed {#static-speed}


## Installation {#installation}


## My Old Blog {#my-old-blog}

-   It's still there
    -   .htaccess issues


## Tags {#tags}

-   Probably don't need them

[^fn:1]: GNU Emacs 26.2, running on macOS 10.14.6.
[^fn:2]: I believe the `ox` part stands for org export.
