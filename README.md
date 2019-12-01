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
  1   03:03:07  4380      0   03:16:05  4023      0
```