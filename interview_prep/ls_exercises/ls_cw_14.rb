=begin
Question:
Find the odd integer
FIRST PASS: 14 min | SECOND PASS: 9:48

Given an array of integers, find the one that appears an odd number of times.

There will always be only one integer that appears an odd number of times.

Examples
[7] should return 7, because it occurs 1 time (which is odd).
[0] should return 0, because it occurs 1 time (which is odd).
[1,1,2] should return 2, because it occurs 1 time (which is odd).
[0,1,0,1,0] should return 0, because it occurs 3 times (which is odd).
[1,2,2,3,3,3,4,3,3,3,2,2,1] should return 4, because it appears 1 time (which is odd).
-----------------------
Questions:

Problem (Rewrite if needed else skip):

Rules:
  Explicit Requirements
  - Find the integer which appears an odd number of times in the Array
  - There will always only be one odd integer

  Implicit Requirements

-----------------------
Examples:
p find_it([20,1,-1,2,-2,3,3,5,5,1,2,4,20,4,-1,-2,5]) == 5
p find_it([1,1,2,-2,5,2,4,4,-1,-2,5]) == -1
p find_it([20,1,1,2,2,3,3,5,5,4,20,4,5]) == 5
p find_it([10]) == 10
p find_it([1,1,1,1,1,1,10,1,1,1,1]) == 10

-----------------------
Modeling:
[1,1,1,1,1,1,10,1,1,1,1]) == 10
Use a hash to get a count of each number

{1 => 10, 10 => 1}

Iterate hash and find value that is odd, return that key

-----------------------
Scratch Pad:


-----------------------
Data Structure:
I: Array
W: Hash of unique integers from the input array as the key, value will be the count of how many times the integer appears in the input array
O: Integer representing the number which appears an odd number of times in the input array

Algorithm:
< given an array `arr` >

Iterate through the input array `arr`, initialize a hash object here as well |int, hash|
  - Increment the value of the current `int` in `hash` by 1

- Iterate through the hash |int, count|
  Return the integer `int` if the `count` is odd

-----------------------
Code:
=end

def find_it(arr)
  arr.each_with_object(hash = Hash.new(0)) do |int, hash|
    hash[int] += 1
  end
  hash.each do |int, count|
    return int if count.odd?
  end
end

p find_it([20,1,-1,2,-2,3,3,5,5,1,2,4,20,4,-1,-2,5]) == 5
p find_it([1,1,2,-2,5,2,4,4,-1,-2,5]) == -1
p find_it([20,1,1,2,2,3,3,5,5,4,20,4,5]) == 5
p find_it([10]) == 10
p find_it([1,1,1,1,1,1,10,1,1,1,1]) == 10
