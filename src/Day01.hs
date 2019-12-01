module Day01 where

import Commons

parseInput :: String -> [Int]
parseInput = map str2Int . lines

fuelRequirement :: Integral a => a -> a
fuelRequirement x = x `div` 3 - 2

totalFuelRequirement :: Integral a => a -> a
totalFuelRequirement x | y < 0     = 0
                       | otherwise = y + totalFuelRequirement y
                       where
                         y = fuelRequirement x

solution :: IO()
solution = do putStr "Part 01: "
              modules <- parseInput <$> getInput "input01.txt"
              print $ sum $ map fuelRequirement modules
              putStr "Part 02: "
              print $ sum $ map totalFuelRequirement modules

main :: IO()
main = solution