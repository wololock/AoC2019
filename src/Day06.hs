module Day06 where

import Commons
import Parser
import Data.Map.Strict (Map)
import qualified Data.Map.Strict as Map
import qualified Data.Set as Set

parser :: Parser (String,String)
parser = do l <- takeUntil (==')')
            char ')'
            r <- takeUntil (=='\n')
            return (r,l)

parseInput :: String -> Map String String
parseInput = Map.fromList . map (runParser parser) . lines

day06a :: Map String String -> Int
day06a m = sum $ Map.elems $ Map.mapWithKey f m
  where
    f k v = case Map.lookup v m of
      Just v' -> 1 + f k v'
      Nothing -> 1

day06b :: Map String String -> Maybe Int
day06b m = do 
  let m' = Map.mapWithKey f m
  you <- Map.lookup "YOU" m'  
  san <- Map.lookup "SAN" m'
  let s1 = Set.fromList you
  let s2 = Set.fromList san
  return (length (Set.difference s1 s2) + length (Set.difference s2 s1) + 2)
  where
    f k v = case Map.lookup v m of
      Just v' -> v' : f k v'
      Nothing -> []

main :: IO()
main = do input <- parseInput <$> getInput "input06.txt"
          putStr "Part 01: "
          print $ day06a input
          putStr "Part 02: "
          print $ day06b input