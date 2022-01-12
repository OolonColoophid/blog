+++
title = "Merge Sort and Recursion"
author = ["Dr Ian Hocking"]
date = 2019-12-31
lastmod = 2019-12-31T17:25:14+00:00
tags = ["Java"]
draft = false
+++

One of the trickiest concepts of my [MSc in Computer Science](https://www.cs.kent.ac.uk/masters/courses/msc-compsci/) is recursion, which
is defined as the act of ['calling oneself'](https://en.wikipedia.org/wiki/Recursion). In the context of computer functions, calling
oneself is useful because it means doing whatever the function just did, but
again, on something it has produced. Tricky to get your head around; even
writing that last sentence was difficult!

As part of the learning process, I've been trying to clarify why I find
recursion hard. The answer seems to be that I want to follow the journey of
the recursion in a linear fashion; in other words, what is the program's state after the first
self call? What is it after the second? This soon becomes overwhelming
because there are too many elements in play. Whenever such confusion has
happened to me in the
past, the solution has lain in a better representation system. In other words, when
Roman numerals are making maths tricky, time to switch to Arabic.

There are many helpful ways of thinking about recursion out there. For instance, I found [this article](https://medium.com/@daniel.oliver.king/getting-started-with-recursion-f89f57c5b60e), which
contains the following insight:

> When talking about writing recursive functions, most people focus on the fact that any recursive function needs to have two parts:
>
> -   A base case, in which the function can return the result immediately
> -   A recursive case, in which the function must call itself to break the current problem down to a simpler level

This is great advice. It goes beyond thinking about recursion linearly, which
I've been trying to do, to thinking more about the algorithmic
perspective---what is this function actually trying to do? Well, it is trying to split
the problem into smaller pieces (recursive case), and when the pieces can't be made
any smaller (base case), the recursions reverse their sequence.

I wanted, however, to write a recursive program that tells me a bit about its
recursive journey, and for that I implemented the `merge sort` algorithm[^fn:1]. This was a
'three birds with one stone' situation. It not only helped my thinking about
recursion, but also about the algorithm itself, as well as giving me more
experience with Java.

I've put the full code (it's not long) on [GitHub](https://github.com/OolonColoophid/mergeSort), but you can see an example of the output
below. This uses the list of numbers from the [Wikipedia article on merge sort](https://en.wikipedia.org/wiki/Merge%5Fsort):
38, 27, 43, 3, 9, 82, 10 (shown in [this diagram](https://en.wikipedia.org/wiki/Merge%5Fsort#/media/File:Merge%5Fsort%5Falgorithm%5Fdiagram.svg)).

The algorithm itself splits (function `mergeSort`) the list into sublists until the lists are only of
one element each. Then, it merges (function `merge`) the sublists into sorted
units of successively longer lengths until the original length is reached---and
thus we have 3, 9, 10, 27, 38, 43, 82.

Here's the output of the program (put the Wikipedia diagram alongside while you read):

```text
- FUNC mergeSort starting
  ...with array [38, 27, 43, 3, 9, 82, 10]
  Recursion INTO FUNC mergeSort for left half
- FUNC mergeSort starting
  ...with array [38, 27, 43, 3]
  Recursion INTO FUNC mergeSort for left half
- FUNC mergeSort starting
  ...with array [38, 27]
  Recursion INTO FUNC mergeSort for left half
- FUNC mergeSort starting
  ...with array [38]
  Base condition (array indivisible)
  Recursion OUT of FUNC mergeSort following base condition
  Recursion INTO FUNC mergeSort right half
- FUNC mergeSort starting
  ...with array [27]
  Base condition (array indivisible)
  Recursion OUT of FUNC mergeSort following base condition
  Base condition met for left and right halves!
- FUNC merge starting
  - 38 > 27 so add 27 to master array and move right pointer
  Making array: [27, 38], now stored master array

  Recursion INTO FUNC mergeSort right half
- FUNC mergeSort starting
  ...with array [43, 3]
  Recursion INTO FUNC mergeSort for left half
- FUNC mergeSort starting
  ...with array [43]
  Base condition (array indivisible)
  Recursion OUT of FUNC mergeSort following base condition
  Recursion INTO FUNC mergeSort right half
- FUNC mergeSort starting
  ...with array [3]
  Base condition (array indivisible)
  Recursion OUT of FUNC mergeSort following base condition
  Base condition met for left and right halves!
- FUNC merge starting
  - 43 > 3 so add 3 to master array and move right pointer
  Making array: [3, 43], now stored master array

  Base condition met for left and right halves!
- FUNC merge starting
  - 27 > 3 so add 3 to master array and move right pointer
  - 27 <= 43 so add 27 to master array and move left pointer
  - 38 <= 43 so add 38 to master array and move left pointer
  Making array: [3, 27, 38, 43], now stored master array

  Recursion INTO FUNC mergeSort right half
- FUNC mergeSort starting
  ...with array [9, 82, 10]
  Recursion INTO FUNC mergeSort for left half
- FUNC mergeSort starting
  ...with array [9, 82]
  Recursion INTO FUNC mergeSort for left half
- FUNC mergeSort starting
  ...with array [9]
  Base condition (array indivisible)
  Recursion OUT of FUNC mergeSort following base condition
  Recursion INTO FUNC mergeSort right half
- FUNC mergeSort starting
  ...with array [82]
  Base condition (array indivisible)
  Recursion OUT of FUNC mergeSort following base condition
  Base condition met for left and right halves!
- FUNC merge starting
  - 9 <= 82 so add 9 to master array and move left pointer
  Making array: [9, 82], now stored master array

  Recursion INTO FUNC mergeSort right half
- FUNC mergeSort starting
  ...with array [10]
  Base condition (array indivisible)
  Recursion OUT of FUNC mergeSort following base condition
  Base condition met for left and right halves!
- FUNC merge starting
  - 9 <= 10 so add 9 to master array and move left pointer
  - 82 > 10 so add 10 to master array and move right pointer
  Making array: [9, 10, 82], now stored master array

  Base condition met for left and right halves!
- FUNC merge starting
  - 3 <= 9 so add 3 to master array and move left pointer
  - 27 > 9 so add 9 to master array and move right pointer
  - 27 > 10 so add 10 to master array and move right pointer
  - 27 <= 82 so add 27 to master array and move left pointer
  - 38 <= 82 so add 38 to master array and move left pointer
  - 43 <= 82 so add 43 to master array and move left pointer
  Making array: [3, 9, 10, 27, 38, 43, 82], now stored master array

---
Sorted result:[3, 9, 10, 27, 38, 43, 82]
```

So putting some comments in the output of merge sort really helped me to
understand the relationship between the algorithm and the recursive code, and I
hope it might help you.

[^fn:1]: Footnotes are recursive! This is just a note to remind you that the merge sort algorithm is a very efficient way of sorting a list of numbers by magnitude, since the time taken to sort has more to do with the number of recursion levels than the linear elements in the list (at least, that's my impression). It was partly created by [John von Neumann](https://en.wikipedia.org/wiki/John%5Fvon%5FNeumann), and I read much about him and the digital revolution in a book called [Turing's Cathedral](https://www.amazon.co.uk/Turings-Cathedral-Origins-Digital-Universe/dp/014101590X).
