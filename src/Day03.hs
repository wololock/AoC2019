module Day03 where

import Commons
import Parser
import Data.Set (Set)
import qualified Data.Set as Set

type Pos = (Int,Int)
type Path = (Char,Int)

parser :: Parser Path
parser = do s <- letter
            n <- int
            return (s,n)

parseInput :: String -> [[Path]]
parseInput = map (map (runParser parser) . splitOn (==',')) . lines

distance :: Pos -> Pos -> Int
distance (x1,y1) (x2,y2) = abs (x1 - x2) + abs (y1 - y2)

path :: Pos -> Path -> [Pos]
path p (s,n) = drop 1 $ case s of
  'R' -> take (n+1) $ iterate (\(x,y) -> (x+1,y)) p
  'L' -> take (n+1) $ iterate (\(x,y) -> (x-1,y)) p
  'U' -> take (n+1) $ iterate (\(x,y) -> (x,y+1)) p
  'D' -> take (n+1) $ iterate (\(x,y) -> (x,y-1)) p

path2coords :: [Path] -> [Pos]
path2coords = snd . foldl f ((0,0), [])
  where
    f (p,xs) x = (p',xs')
      where
        ps  = path p x
        xs' = xs ++ ps
        p'  = last ps

day03a :: [Pos] -> [Pos] -> Int
day03a xs ys = minimum $ Set.map (distance (0,0)) $ Set.intersection (Set.fromList xs) (Set.fromList ys)

day03b :: [Pos] -> [Pos] -> Int
day03b xs ys = (+2) $ minimum $ Set.map f $ Set.intersection (Set.fromList xs) (Set.fromList ys)
  where
    f p = length (takeWhile (/=p) xs) + length (takeWhile (/=p) ys)

main :: IO()
main = do input <- parseInput <$> getInput "input03.txt"
          let xs = path2coords $ head input
          let ys = path2coords $ last input              
          putStr "Part 01: "              
          print $ day03a xs ys
          putStr "Part 02: "
          print $ day03b xs ys