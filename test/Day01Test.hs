module Day01Test (day01Tests) where
import qualified Day01(part1, part2)

import Test.HUnit
  ( Counts,
    Test (TestCase, TestList),
    assertEqual,
    runTestTT,
  )

-- Test Cases
-- Part 1
testPart1 :: Test
testPart1 = TestCase (assertEqual "Part 1" 7 
  (Day01.part1 "199\n200\n208\n210\n200\n207\n240\n269\n260\n263"))

-- Part 2
testPart2 :: Test
testPart2 = TestCase (assertEqual "for Part 2," 0 (Day01.part2 ""))

-- Group test cases
tests :: Test
tests = TestList [testPart1, testPart2]

-- Run test cases
day01Tests :: IO Counts
day01Tests = runTestTT tests
