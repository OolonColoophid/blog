+++
title = "Java Puzzles"
author = ["Dr Ian Hocking"]
date = 2019-10-05
lastmod = 2019-10-05T16:09:28+01:00
draft = false
+++

I'm not that far into my Java journey, but I've come across this interesting
Java puzzle, set by one of my MSc instructors. I'm setting it down here to help
me remember it. The puzzle isn't unique to our course, and I've seen it
discussed elsewhere (not that I searched until I'd given it a thorough
working over privately, first!).

Essentially, we are asked: "Is the method below to determine whether a number is
odd correct?"

<a id="code-snippet--isOdd"></a>
```java

public class MyClass {

    public static boolean isOdd(int i) {
        return i % 2 == 1;
    }

    public static void main(String[] args){

        System.out.println("1 is " + isOdd(1));
        System.out.println("2 is " + isOdd(2));    }
}
```

`isOdd` is a predicate function, in that it should return `true` for odd numbers
and `false` for even numbers. The version you see above, [isOdd](#code-snippet--isOdd), has some extra
wrapper Java around it--to make it work with Org Babel--, including the two print statements in the `main` method,
but is otherwise identical to the one set by our instructor.

Intuitively, it looks correct. It applies the function `modulus 2` (i.e. the
remainder when the parameter is divided by two). This should return `0` for even
numbers - what we want - and `1` for odd numbers - also what we want.

You can see my testing in the table below.

<div class="table-caption">
  <span class="table-number">Table 1</span>:
  Testing isOdd
</div>

| Input | Modulus Result (% 2) | Function Should Output | Function Outputs |
|-------|----------------------|------------------------|------------------|
| 5     | 1                    | True                   | True             |
| 4     | 0                    | False                  | False            |
| 11    | 1                    | True                   | True             |
| 100   | 0                    | False                  | False            |
| -5    | 1                    | True                   | False            |
| 0     | 0                    | False                  | False            |

Aha - it fails with negative numbers.

This made me double check how a modulus works with negative numbers. It turns out that, in
mathematics, the modulus of a negative is normally positive (i.e. without a
sign). However, some programming languages - including Java - keep
the sign. I can see this is helpful in retaining a something about the
calculation. Essentially, it allows us to recover that the one of the terms in
the modulus was negative.

And this negative number case is indeed the failure point for the method. To make `isOdd` work for
negatives, our conditional should test for a non-zero remainder such as `-1` in
the case of modulus `5`. The corrected
source is below, along with my test numbers from the table above.

```java

public class MyClass {

    public static boolean isOdd(int i) {
        return i % 2 != 0;
    }

    public static void main(String[] args){

        System.out.println("Is 5 odd? " + isOdd(5));
        System.out.println("Is 4 odd? " + isOdd(4));
        System.out.println("Is 11 odd? " + isOdd(11));
        System.out.println("Is 100 odd? " + isOdd(100));
        System.out.println("Is -5 odd? " + isOdd(-5));
        System.out.println("Is 0 odd? " + isOdd(0));
    }
}
```

```text
Is 5 odd? true
Is 4 odd? false
Is 11 odd? true
Is 100 odd? false
Is -5 odd? true
Is 0 odd? false
```
