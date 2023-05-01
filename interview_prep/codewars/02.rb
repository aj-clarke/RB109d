=begin
.Find all pairs
(https://www.codewars.com/kata/5c55ad8c9d76d41a62b4ede3/train/ruby)
7 kyu
Find all pairs
You are given array of integers, your task will be to count all pairs in that array and return their count.
Notes:
Array can be empty or contain only one value; in this case return 0
If there are more pairs of a certain number, count each pair only once. E.g.: for [0, 0, 0, 0] the return value is 2 (= 2 pairs of 0s)
Random tests: maximum array length is 1000, range of values in array is between 0 and 1000

[1, 2, 5, 6, 5, 2] --> 2
...because there are 2 pairs: 2 and 5
[1, 2, 2, 20, 6, 20, 2, 6, 2] --> 4
...because there are 4 pairs: 2, 20, 6 and 2 (again)

-----------------------
Questions:

Problem (Rewrite if needed else skip):

Input: Array of integers
Output: A total count of integer pairs, pairs are not always unique
Rules:
  Explicit Requirements
  - Return the count all duplicate pairs of integers
  - If an integer has a count of 4, then that is 2 pairs
  - Empty or single integer arrays return 0 (or if multi integer array does not contain duplicates)

  Implicit Requirements
  - 

-----------------------
Modeling:
[1, 2, 5, 6, 5, 2] (sort)
{1 => 1, 2 => 2, 5 => 2, 6 => 1}

-----------------------
Examples:
pairs([1, 2, 5, 6, 5, 2]) == 2
pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4
pairs([0, 0, 0, 0, 0, 0, 0]) == 3
pairs([1000, 1000]) == 1
pairs([]) == 0
pairs([54]) == 0

-----------------------
Scratch Pad:


-----------------------
Data Structure: Array as input, hash containing array elements as key and the total count of each as the value
Algorithm:
- Iterate through the array, while creating a hash to hold key/value pairs
  - Each with object > Hash.new(0)
- For each integer, associate it with a new key in hash, increment the value (count)
  - `hash[num] += 1`
- Iterate through hash - Divide each value by 2
  - Each `value` divide by 2
- Add all the values to obtain total count of pairs
  - Reduce to obtain total

-----------------------
Code:
=end

def pairs(arr)
  arr.each_with_object(hash = Hash.new(0)) do |num, hash|
    hash[num] += 1
  end

  values = hash.values
  values.map! do |v|
    v / 2
  end
  values.eql?([]) ? 0 : values.reduce(:+)
end




p pairs([1, 2, 5, 6, 5, 2]) #== 2
# p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4
# p pairs([0, 0, 0, 0, 0, 0, 0]) == 3
# p pairs([1000, 1000]) == 1
# p pairs([]) == 0
# p pairs([54]) == 0