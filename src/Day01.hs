module Day01 (part1, part2) where

import Data.List.Split (splitOn)
import Text.Read (readMaybe)

part1 :: String -> Int
part1 = fst . foldl readIncrease (0, Nothing) . splitOn "\n"
    where
        readIncrease :: (Int, Maybe Int) -> String -> (Int, Maybe Int)
        readIncrease (acc, prev) str = case (parseInt str, prev) of
            (Just val, Just p) -> (acc + fromEnum (val > p), Just val)
            (Just val, Nothing) -> (acc, Just val)
            (Nothing, _) -> (acc, prev)

        parseInt str = readMaybe str :: Maybe Int 

part2 :: String -> Int
part2 _ = 0