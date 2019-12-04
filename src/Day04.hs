module Day04 where

import Data.List (sort,group)

isPassword :: (Int -> Bool) -> Int -> Bool
isPassword p n = any p (map length (group s)) && s == sort s
  where
    s = show n

main :: IO()
main = do let ns = [206938..679128]
          putStr "Part 01: "
          print $ length $ filter (isPassword (>=2)) ns
          putStr "Part 02: "
          print $ length $ filter (isPassword (==2)) ns
