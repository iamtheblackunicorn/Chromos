# EXAMPLES :honey_pot:

## Let's greet the world!

This is what a traditional "Hello World" program would look like in *Chromos*:

```text
// hello.chr

prog start

  // Prints out "HELLO WORLD".
  
  message start => "01"
    000008
    000005
    00000C
    00000C
    00000F
  message end => "01"
  
  message start => "02"
    000017
    00000F
    000012
    00000C
    000004
  message end => "02"
  
prog end
```

If you run this with the command:

```bash
$ chromos hello.chr
```
this is the output:
```text
HELLO
WORLD
```

## Let's make some calculations!

If you want to see how the operators of *Chromos* work, here's an example:

```text
// sample.chr

prog start

  // Prints out some calculations.

  message start => "1"
    00FF88
    0088AA
  message end => "1"

  computePlus start => "2"
    00FF88
    0088AA
  compute end => "2"

  computeMinus start => "3"
    00FF88
    0088AA
  compute end => "3"

  computeTimes start => "4"
    00FF88
    0088AA
  compute end => "4"

  computeBy start => "5"
    00FF88
    0088AA
  compute end => "5"

prog end
```

If you run this with the command:

```bash
$ chromos sample.chr
```
this is the output:
```text
6541634986
100402
30430
2288644176
2
```

If the hexadecimal numbers you use in a `message` block are larger than 25, the number will be printed in decimal format.
