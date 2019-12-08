module Day08 where

import Commons
import Data.List.Split (chunksOf)
import Data.List (minimumBy,transpose)

day08a :: String -> Int
day08a input = x * y
  where 
    (_,row) = minimumBy (\(a,_) (b,_) -> compare a b) $ map (\xs -> (length $ filter (=='0') xs, xs)) $ chunksOf (25*6) input
    x       = length $ filter (=='1') row
    y       = length $ filter (=='2') row

day08b :: String -> IO()
day08b = putStr . unlines . chunksOf 25 . map (f . head . dropWhile (=='2')) . transpose . chunksOf (25*6)
  where 
    f c = case c of
      '0' -> ' '
      '1' -> '█'

main :: IO()
main = do input <- getInput "input08.txt"
          putStr "Part 01: "
          print $ day08a input
          putStrLn "Part 02: "
          day08b input
