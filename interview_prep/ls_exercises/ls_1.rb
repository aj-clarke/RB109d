=begin
Question:
Smaller numbers than current
FIRST: 21:25 | SECOND: 14:38 | THIRD: 13:57 | FOURTH: 15:30 | FIFTH: 11:23
SIXTH: 9:44
# Given an array of numbers, for each number find out how many numbers
# in the array are smaller than it. When counting numbers, only count
# unique values. That is, if a given number occurs multiple times in
# the array, it should only be counted once.

# The tests above should print "true".

-----------------------
Rules:
  Explicit Requirements
  - Find the count of numbers that are less than the current number (current element)
  - Only unique numbers count when tallying how many numbers are less than the current

  Implicit Requirements
  - If no numbers are lower than than the current number, the count for that number should be `0`

I: Array of integers
O: Array of integers


-----------------------
Examples:
p smaller_numbers_than_current([8,1,2,2,3]) == [3, 0, 1, 1, 2]
p smaller_numbers_than_current([1,4,6,8,13,2,4,5,4]) == [0, 2, 4, 5, 6, 1, 2, 3, 2]
p smaller_numbers_than_current([7,7,7,7]) == [0,0,0,0]
p smaller_numbers_than_current([6,5,4,8]) == [2, 1, 0, 3]
p smaller_numbers_than_current([1]) == [0]

-----------------------
Modeling:
[8,1,2,2,3] == [3, 0, 1, 1, 2]
unique array to compare each number against
[8,1,2,3]
8: 1, 2, 3 => 3
1: => 0
2: 1 => 1
2: 1 => 1
3: 1, 2 => 3

Init `uniq_array` to unique items within the input arrays

Iterate through input array, compare against unique array for counts
  Init `counter` to store count of 'greater than'
  Iterate through unique Array
    If `input array element` > `unique array element`
      Add 1 to the counter
  push into a `results` Array

Add results of obtaining "greater than" into a new Array

return that array

-----------------------
Data Structure:
I: Array of integers
W:
Array to store resulting counts into
Unique array from input array for comparison
Work with input array
O: Array of 'counts'

Algorithm:
< given an array `arr` >

Init `unique_arr` to `arr` unique values

Iterate through `arr` (input array) to compare against `unique_arr` (unique array) |arr_ele|
  Initialize a `counter` to 0 to store how many integers the current element is greater than
  Iterate through `unique_arr` |uniq_ele|
    If `arr_ele` is greater than `uniq_ele`
      Add 1 to the ocunter
  push `counter` into `result` array

  return `result`

-----------------------
Code:
=end

def smaller_numbers_than_current(arr)
  unique_arr = arr.uniq
  result = []

  arr.each do |arr_ele|
    counter = 0
    unique_arr.each do |uniq_ele|
      counter += 1 if arr_ele > uniq_ele
    end
    result << counter
  end
  result
end

p smaller_numbers_than_current([8,1,2,2,3]) == [3, 0, 1, 1, 2]
p smaller_numbers_than_current([1,4,6,8,13,2,4,5,4]) == [0, 2, 4, 5, 6, 1, 2, 3, 2]
p smaller_numbers_than_current([7,7,7,7]) == [0,0,0,0]
p smaller_numbers_than_current([6,5,4,8]) == [2, 1, 0, 3]
p smaller_numbers_than_current([1]) == [0]