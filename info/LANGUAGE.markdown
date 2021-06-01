# Language tour :book:

*Chromos* is a very minimal language and its programs end in `*.chr`.

## Types

In *Chromos* there is only one type. This type is the hexadecimal number.
This is a number like `FF00FF`.

## Output mechanisms

In *Chromos* there are only two output mechanisms:

- The `message` operator, which is much like the `print` operator in other languages.
- The `compute` operator, which calculates a result from given input.

### The `message` operator

This block operator gives the user the power to print out messages to the console.
Each hexadecimal number has to be smaller than 26 and correspond to some letter in the
alphabet. If it is not smaller than 26 a number will be displayed. Here's an example:
The arrow and `01` denote the name of this message block. This name has to be an integer.

```text
prog start
  message start => "01"
    00FF56
    987645
  message end => "01"
prog end
```

### The `compute` operator

The compute operator allows you to make basic calculations. Similar to the `message` operator, there is also a block identifier. This identifier has to be an integer!
Different from the `message` operator, you have to say which operation you would like done. For `minus`, `times`, and `by`, use `computeMinus`, `computeTimes`, and `computeBy`. Here's an example:

```text
prog start
  // Adds up "00FF56" and "987645".
  computePlus start => "01"
    00FF56
    987645
  compute end => "01"
prog end
```

### Neccessary operators

So that the interpreter knows where your code starts and ends, each program starts and ends, we have to explicitly declare this by starting each program with `prog start` and ending each program with `program end`. Every block that follows the starting statement has to be indented with two spaces, ***NOT*** tabs!

### Comments

Comments in *Chromos* are written like this:

```dart
// This is a comment.
```
