=begin
Minimum Sum
FIRST: 14:45 mins | SECOND: 12:54 | THIRD: 12:53 | FOURTH: 11:33

Question:
# Write a method that takes one argument: an array of integers.
# The method should return the minimum sum of 5 consecutive
# numbers in the array. If the array contains fewer than 5
# elements, the method should return nil.

-----------------------
Rules:
  Explicit Requirements
  - Return minimum sum of 5 consecutive numbers in the array
  - Return `nil` if input array is less than 5 elements

  Implicit Requirements

-----------------------
Examples:
p minimum_sum([1, 2, 3, 4]) == nil
p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10

-----------------------
Modeling:
[1, 2, 3, 4, 5, 6] == 15

`subarrays` for 5 element subarrays
[[1, 2, 3, 4, 5], [2, 3, 4, 5, 6]]
Get the sum of each
[[15], [20]] (flatten)
[15, 20]

Return the smallest sum element by sorting then returning first element

-----------------------
Data Structure:
I: Array of integers
W: Array of subarrays (nested array)
O: Smallest subarray sum gained from adding each integer within each subarray

Algorithm:
< given an array `arr` >

Init `subarrays` to empty collection

Iterate through `arr` to get starting index |start_idx|
  Iterate through `arr` to get ending index |end_idx|
    Push into `subarrays` the result of the range from `arr` `start_idx` to `end_idx` if the size of that array is equal to 5

CHECK SUBARRAYS

Set `subarrays` equal to iterating through the subarrray |subarray|
  Transform each subarray to the sum of its integers
Sort then return first element

-----------------------
Code:
=end

def minimum_sum(arr)
  return nil if arr.length < 5

  subarrays = []

  (0...arr.size).each do |start_idx|
    (start_idx...arr.size).each do |end_idx|
      subarrays << arr[start_idx..end_idx] if arr[start_idx..end_idx].size.eql?(5)
    end
  end
  subarrays = subarrays.map do |subarray|
    subarray.sum
  end.sort.first
end

# p minimum_sum([1, 2, 3, 4]) == nil
p minimum_sum([1, 2, 3, 4, 5, 6]) #== 15
# p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
# p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10


=begin
SECOND PASS little nicer solution

=begin
Question:
# Write a method that takes one argument: an array of integers.
# The method should return the minimum sum of 5 consecutive
# numbers in the array. If the array contains fewer than 5
# elements, the method should return nil.

-----------------------
Rules:
  Explicit Requirements
  - Return the min sum of 5 consecutive numbers in the input array
  - If input array contains less than 5 elements, return `nil`

  Implicit Requirements

-----------------------
Examples:
p minimum_sum([1, 2, 3, 4]) == nil
p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10

-----------------------
Modeling:
[1, 2, 3, 4, 5, 6]) == 15

`arr` => [1, 2, 3, 4, 5, 6]

Return `nil` if `arr` size less than 5

Init `sums` to empty collection

Iterate `arr` from 0 index to last index |start_idx|
Iterate `arr` from /start_idx plus 1/ to the last index |end_idx|
  (only capture subarrays containing 5 elements) => [1, 2, 3, 4, 5] => [2, 3, 4, 5, 6]
  Push subarrays of that length into `sums` after summing the subarray

Return the minimum value from `sums`

-----------------------
Data Structure:
I: Array of integers
W: Nested array of subarrays => Array of sums (of those subarrays)
O: Minimum value from the array of summed subarrays

Algorithm:
Return `nil` if `arr` size less than 5

Init `sums` to empty collection

Iterate `arr` from 0 index to last index |start_idx|
Iterate `arr` from /start_idx plus 1/ to the last index |end_idx|
  (only capture subarrays containing 5 elements) 
  Push subarrays of that length into `sums` after summing the subarray

Return the minimum value from `sums`

-----------------------
Code:
=end

def minimum_sum(arr)
  return nil if arr.size < 5

  sums = []

  (0...arr.size).each do |start_idx|
    (start_idx+1...arr.size).each do |end_idx|
      sums << arr[start_idx..end_idx].reduce(:+) if arr[start_idx..end_idx].size.eql?(5)
    end
  end
  sums.min
end

p minimum_sum([1, 2, 3, 4]) == nil
p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10

#-------------------------------------------------------------------------------

=begin
Question:
# Write a method that takes one argument: an array of integers.
# The method should return the minimum sum of 5 consecutive
# numbers in the array. If the array contains fewer than 5
# elements, the method should return nil.

-----------------------
Questions:

Rules:
  Explicit Requirements
  - Return MIN sum of 5 consecutive numbers (subarrays)
  - If input array contains less that 5 elements, return `nil`

  Implicit Requirements
  - Obtain subarrays with a length of 5

-----------------------
Examples:
p minimum_sum([1, 2, 3, 4]) == nil
p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10

-----------------------
Modeling:
[55, 2, 6, 5, 1, 2, 9, 3, 5, 100] == 16

`arr` => [55, 2, 6, 5, 1, 2, 9, 3, 5, 100]
Get subarrays of 5
[[55, 2, 6, 5, 1],[2, 6, 5, 1, 2],[6, 5, 1, 2, 9],...[2, 9, 3, 5, 100]]

Return `nil` if `arr` < 5

Init `subarrs` to an empty collection

Nested iterate `arr`:
  From 0 to last arr idx pos |si|
    From si to last arr idx pos |ei|
      Into `subarrs` push the sum of `arr` from `si` to `ei` inclusive /IF/ the size of that subarray is 5 in length

From `subarrs` return the min value


-----------------------
Data Structure:
I: Array of ints
W: Array of subarrays (nested array) equal to 5 in length
O: Minimum sum value of the above subarrays

Algorithm:
< given an array `arr` >

Return `nil` if `arr` < 5

Init `subarrs` to an empty collection

Nested iterate `arr`:
  From 0 to last arr idx pos |si|
    From si to last arr idx pos |ei|
      Into `subarrs` push the sum of `arr` from `si` to `ei` inclusive /IF/ the size of that subarray is 5 in length

From `subarrs` return the min value
-----------------------
Code:
=end

def minimum_sum(arr)
  return nil if arr.size < 5

  subarrs = []

  (0...arr.size).each do |si|
    (si...arr.size).each do |ei|
      subarrs << arr[si..ei].sum if arr[si..ei].size.eql?(5)
    end
  end

  subarrs.min
end

p minimum_sum([1, 2, 3, 4]) == nil
p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10
