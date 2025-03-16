module Day01 (part1, part2) where

import Data.List.Split (splitOn)
import Text.Read (readMaybe)



part1 :: String -> Int
part1 = fst . foldl readIncrease (0, Nothing) . splitOn "\n"
    where
        readIncrease (acc, prev) str = case (parseInt str, prev) of
            (Just val, Just p) -> (acc + fromEnum (val > p), Just val)
            (Just val, Nothing) -> (acc, Just val)
            (Nothing, _) -> (acc, prev)


part2 :: String -> Int
part2 = fst . foldl slidingWindow (0, []) . splitOn "\n"
    where 
        slidingWindow (acc, window) str = case parseInt str of
            Just val -> 
                let newWindow = updateWindow window val
                    cmp = compareWin newWindow 
                in (acc + fromEnum cmp, newWindow)
            Nothing-> (acc, window)

        updateWindow window val = case window of 
            [] -> [val]
            [x] -> [x+val, val]
            [x,y] -> [x+val, y+val, val]
            [x,y,z] -> [x, y+val, z+val, val]
            [_, y, z, a] -> [y, z+val, a+val, val]
            _ -> []

        compareWin :: [Int] -> Bool
        compareWin (x:y:_) = x < y
        compareWin _ = False


parseInt :: String -> Maybe Int
parseInt str = readMaybe str :: Maybe Int 