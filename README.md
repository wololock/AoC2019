# Advent Of Code 2019 Challenge with Haskell

This is the repository with my solutions to Advent Of Code 2019 challanges.

## Working with code

All solutions can be used inside GHCi (Haskell REPL), e.g.

```
$ cd src
$ ghci Day01.hs
GHCi, version 8.4.4: http://www.haskell.org/ghc/  :? for help
[1 of 2] Compiling Commons          ( Commons.hs, interpreted )
[2 of 2] Compiling Day01            ( Day01.hs, interpreted )
Ok, two modules loaded.
*Day01> 
```

Programs also can be compiled to executable file (useful for better performance), e.g.

```
$ ghc -O2 -o out/Day01 Day01.hs -rtsopts -main-is Day01

$ out/Day01 
Part 01: 3386686
Part 02: 5077155
```

## Personal stats

```
      -------Part 1--------   -------Part 2--------
Day       Time  Rank  Score       Time  Rank  Score
  9   00:35:46   673      0   00:53:30  1061      0
  8   01:33:41  3337      0   01:47:35  3003      0
  7   00:22:26   702      0   02:38:24  1702      0
  6   03:05:09  5208      0   03:25:02  4564      0
  5   00:43:43  1186      0   00:48:19   724      0
  4   00:29:35  3302      0   00:42:10  2576      0
  3   01:54:50  3560      0   02:09:41  2911      0
  2   00:45:31  3149      0   01:01:57  2807      0
  1   03:03:07  4380      0   03:16:05  4023      0
```