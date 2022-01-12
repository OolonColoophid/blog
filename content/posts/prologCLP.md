+++
title = "Solving Sudoku Puzzles with Prolog"
author = ["Dr Ian Hocking"]
date = 2020-05-21
lastmod = 2020-05-21T13:31:41+01:00
draft = false
+++

[Prolog](https://en.wikipedia.org/wiki/Prolog) has been a mind-expanding discovery. It is, at once, the most frustrating
computer language I've ever used, and the most elegant and expressive. It
works by taking a question about a notional world and trying to make it true. Any
variables that are needed to achieve this truth can then feed into other
questions. Sound weird? It is!

Because Prolog is non-imperative, it can make those of us used to imperative
programming bang our heads on the desk a few times; but it turns out there are
advantages to describing your problem well and letting the computer figure out
the program to solve it. As long as the description works, the program should work, and one
thing's for sure: the description is a lot shorter and clearer.

Towards the end of my logic programming module at the University of Kent, we
were introduced to constraint-based programming. In a nutshell, this works by
describing a domain (e.g. a map of the world's countries), variables
(e.g. the countries), and values those variables can take (e.g. colours). We can
then give a constraint: 'I would like each country on the map to have a colour,
but neighbouring countries must not have the same colour'. Prolog--with some
help from a finite domain constraint programming library, [CLP(FD)](https://www.swi-prolog.org/man/clpfd.html)--will then pootle off
and provide you with all of the ways in which this constraint can be fulfilled.
In this case, it would be the number of maps that exist where neighbouring
countries have different colours, together with the colours themselves.

Now, I love a good [Sudoku](https://en.wikipedia.org/wiki/Sudoku). As Wikipedia
tell us, the objective of Sudoku is:

> ...is to fill a 9×9 grid with digits so that each column, each row, and each of the nine 3×3 subgrids that compose the grid (also called "boxes", "blocks", or "regions") contain all of the digits from 1 to 9. The puzzle setter provides a partially completed grid, which for a well-posed puzzle has a single solution.

A perfect way to exercise my Prolog skills to implement the constraints! It took
me a couple of hours and works successfully--in an imperative language like Python, this would have been a lot longer,
and probably involving a few bugs. Plus, it works
with
the [world's
hardest sudoku](https://www.conceptispuzzles.com/index.aspx?uri=info/article/424)!

The code is over at [my Github page](https://github.com/OolonColoophid).

Finally, in my Prolog journey, I came across some great learning resources
beyond those offered by Stefan and Andy at UKC. [Learn prolog in Y
Minutes](https://learnxinyminutes.com/docs/prolog/) takes a fairly 'quick and dirty' approach, but will get you to speed.
[Learn Prolog Now!](http://lpn.swi-prolog.org/lpnpage.php?pagetype=html&pageid=lpn-htmlli4) is more in depth.
