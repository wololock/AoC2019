module Day02 where

import Commons
import Data.Sequence (Seq)
import qualified Data.Sequence as Seq

parseInput :: String -> Seq Int
parseInput = Seq.fromList . map read . (splitOn (==','))

run :: Int -> Seq Int -> Int
run p prog = case code of
    -- addition
    1  -> run (p+4) (update addr prog (x+y))
    -- multiplication
    2  -> run (p+4) (update addr prog (x*y))
    -- termination  
    99 -> reg 0
    _  -> error ("Incorrect code!")

    where
      reg i = prog `Seq.index` i
      code  = reg p
      x     = reg $ reg (p+1)
      y     = reg $ reg (p+2)
      addr  = reg (p+3)

      update i prod v = Seq.update i v prog

reset :: Int -> Int -> Seq Int -> Seq Int
reset x y xs = (Seq.update 1 x (Seq.update 2 y xs))

day02b :: Int -> Seq Int -> Int
day02b n xs = 100 * noun + verb
  where
    (x',_)   = head $ dropWhile (\(_,v) -> n > v) [(x, run 0 (reset x 0 xs)) | x <- [0..]]
    noun     = x' - 1
    (verb,_) = head $ dropWhile (\(_,v) -> n /= v) [(y, run 0 (reset noun y xs)) | y <- [0..]]

main :: IO()
main = do putStr "Part 01: "              
          prog <- parseInput <$> getInput "input02.txt"
          print $ run 0 (reset 12 2 prog)
          putStr "Part 02: "
          print $ day02b 19690720 prog
