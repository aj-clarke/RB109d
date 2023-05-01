=begin
Question:
FIRST ATTEMPT 7:30
Sort the given strings in alphabetical order, case insensitive. For example:

["Hello", "there", "I'm", "fine"]  -->  ["fine", "Hello", "I'm", "there"]
["C", "d", "a", "B"])              -->  ["a", "B", "C", "d"]


-----------------------
Rules:
  Explicit Requirements
  - Sort the arrays
  - Case doesn't matter

  Implicit Requirements

-----------------------
Examples:
p sortme(["Hello", "there", "I'm", "fine"]) #== ["fine", "Hello", "I'm", "there"]
p sortme(["C", "d", "a", "B"]) #== ["a", "B", "C", "d"]
p sortme(["CodeWars"]) #== ["CodeWars"]

-----------------------
Modeling:
["C", "d", "a", "B"]) == ["a", "B", "C", "d"]

`arr` = ["C", "d", "a", "B"]

Sort the input array BY downcasing the elements temporarly

-----------------------

Data Structure:
I: Array
W: Sorting the array
O: Case insensitive sorted array

Algorithm:
< given an array `arr` >

Iterate/sort the array by temp downcased characters
Implicitly return
-----------------------
Code:
=end

def sortme(arr)
  arr.sort_by { |char| char.downcase }
end

p sortme(["Hello", "there", "I'm", "fine"]) == ["fine", "Hello", "I'm", "there"]
p sortme(["C", "d", "a", "B"]) == ["a", "B", "C", "d"]
p sortme(["CodeWars"]) == ["CodeWars"]


def sortme(arr)
  downcase_arr = arr.map(&:downcase)
  sorted_downcase_arr = downcase_arr.sort
  index_vals = sorted_downcase_arr.map { |word| downcase_arr.index(word) }
  index_vals.map { |idx| arr[idx] }
end