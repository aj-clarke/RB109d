=begin
Question:
Find all pairs
FIRST: 18:30 | SECOND 17:18 | THIRD: 10:13

You are given array of integers, your task will be to count all pairs in that array and return their count.

Notes:

Array can be empty or contain only one value; in this case return 0
If there are more pairs of a certain number, count each pair only once. E.g.: for [0, 0, 0, 0] the return value is 2 (= 2 pairs of 0s)
Random tests: maximum array length is 1000, range of values in array is between 0 and 1000
Examples
[1, 2, 5, 6, 5, 2]  -->  2
...because there are 2 pairs: 2 and 5

[1, 2, 2, 20, 6, 20, 2, 6, 2]  -->  4
...because there are 4 pairs: 2, 20, 6 and 2 (again)
-----------------------
Rules:
  Explicit Requirements
  - Count all matching numbers in the input array.
  - If there are more than one pair of a given number then count it as a second, third, etc....pair [2, 2, 2, 2] => two pairs of 2 > result 2

  Implicit Requirements

-----------------------
Examples:
pairs([1, 2, 5, 6, 5, 2]) == 2
pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4
pairs([0, 0, 0, 0, 0, 0, 0]) == 3 
pairs([1000, 1000]) == 1
pairs([]) == 0
pairs([54]) == 0

-----------------------
Modeling:
[1, 2, 5, 6, 5, 2] => 2 pairs

get count of numbers in an hash
  integer is key, count of integers is value

divide each value by 2 and return count of values

-----------------------
Data Structure:
I: Array of integers
W: Hash of integer/count pairs
O: Count of how many pairs are in the input array

Algorithm:
< given an array `arr` >

If array is empty or contains only 1 element return 0

Iterate through `arr` with a hash object |int, hash|
  hash/int/ key, increment value by 1

Set hash equal to: Iterate `hash` and transform the values to dividing the value by 2

Obtaining the sum of the returned array

-----------------------
Code:
=end

def pairs(arr)
  return 0 if arr.size < 2

  arr.each_with_object(hash = Hash.new(0)) do |int, hash|
    hash[int] += 1
  end
  hash = hash.map { |int, count| count / 2 }
  hash.sum
end

p pairs([1, 2, 5, 6, 5, 2]) == 2
p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4
p pairs([0, 0, 0, 0, 0, 0, 0]) == 3
p pairs([1000, 1000]) == 1
p pairs([]) == 0
p pairs([54]) == 0



#-------------------------------------------------------------------------------
=begin
THIRD

Modeling:
[1, 2, 2, 20, 6, 20, 2, 6, 2] == 4

`arr` => [1, 2, 2, 20, 6, 20, 2, 6, 2]

Init `counts` hash to iterating through `arr` and associating the uniq ints as keys and their counts as values

`counts` => {1=>1, 2=>4}

Iterate `counts` and divide each value by 2, then return the sum of the values

-----------------------
Data Structure:
I: Array of ints
W: Hash of int as keys and counts as values 
O: Num of pairs in int format

Algorithm:
< given an array `arr` >

Init `counts` hash to iterating through `arr` and associating the uniq ints as keys and their counts as values

`counts` => {1=>1, 2=>4}

Iterate `counts` and divide each value by 2, then return the sum of the values

-----------------------
Code:
=end

def pairs(arr)
  arr.each_with_object(counts = Hash.new(0)) do |int|
    counts[int] += 1
  end
  counts = counts.map { |int, count| [int, count / 2] }.to_h
  counts.values.sum
end

p pairs([1, 2, 5, 6, 5, 2]) == 2
p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4
p pairs([0, 0, 0, 0, 0, 0, 0]) == 3
p pairs([1000, 1000]) == 1
p pairs([]) == 0
p pairs([54]) == 0