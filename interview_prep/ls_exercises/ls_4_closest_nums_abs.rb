=begin
Question:
Closest numbers (28:37)
FIRST: 28:37 | SECOND: 29:30 | THIRD: 26:00 | FOURTH: 18:55 | FIFTH: 16:30
SIXTH: 17:31 (start/stop Ester chatting)
# Write a method that takes an array of integers and returns the
# two numbers that are closest together in value.

-----------------------
Rules:
  Explicit Requirements
  - Given array of integers, return two numbers closest together in value

  Implicit Requirements
  - If two pairs of numbers have the same closest value then return the first two numbers

I: Array
O: Array of two integers closest in value to one another


-----------------------
Examples:
p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 7, 17]) == [12, 7]


-----------------------
Modeling:
Modeling:
[19, 25, 32, 4, 27, 16] == [25, 27]
[[19,25],[19,32],..[4,16],[27,16]]

`arr` => [19, 25, 32, 4, 27, 16]

Init `pairs` to an empty collection
Init `pair_diff` to an empty collection

Nested iterate `arr` to obtain pairs and push them into `pairs` => [[19,25],[19,32],..[25,27],..[27,16]]
(the absolute value of the diff of those pairs will be pushed into `diff_val` as well)

# Init `pair_diff` to transforming `pairs` subarrays into their differences => [[6],[13],..[2],..[11]]

Init `pair_min` to the minimum value in `pair_diff` => 2
Init `lowest_idx` to finding index pos of `pair_min` in `pair_diff` => 6?

Return the `lowest_idx` index pos from `arr`

-----------------------
Data Structure:
I: Array
W: Nested arrays
O: Subarray containing the numbers that are closest in value

Algorithm:
< given an array `arr` >

Init `pairs` to an empty collection
Init `pair_diff` to an empty collection

Nested iterate `arr` to obtain pairs and push them into `pairs`
  Iterate `arr` from 0 idx pos to end of `arr` |first_ele|
    Iterate `arr` from (first_ele plus 1) to end of `arr` |second_ele|
      Into `pairs` push in each pair [`first_ele`, `second_ele`]
      Into `pair_diff` push in return val of `first_ele` minus `second_ele` (absolute value)

Init `pair_diff` to transforming `pairs` subarrays into their differences values
Init `pair_min` to the `pair_diff` arrays minimum value
Init `lowest_idx` equal to finding within the `pair_diff` array, the index position of `pair_min`s value

Return the `lowest_idx` index pos from `arr`
-----------------------
Code:
=end

# def closest_numbers(arr)
#   pairs = []

#   (0...arr.size).each do |first_ele|
#     (first_ele+1...arr.size).each do |second_ele|
#       pairs << [arr[first_ele], arr[second_ele]]
#     end
#   end
#   pair_diff = pairs.map { |subarr| subarr.reduce(:-).abs }
#   pair_min = pair_diff.min
#   lowest_idx = pair_diff.index(pair_min)

#   pairs[lowest_idx]
# end

def closest_numbers(arr)
  pairs = []
  pair_diff = []

  (0...arr.size).each do |first|
    (first+1...arr.size).each do |second|
      pairs << [arr[first], arr[second]]
      pair_diff << (arr[first] - arr[second]).abs
    end
  end
  # results = pairs.map { |subarray| subarray.sort.reverse.reduce(:-) }
  # lowest_idx = 0
  # value = results[0]
  # results.each_with_index do |ele, idx|
  #   if ele < value
  #     lowest_idx = idx
  #     value = ele
  #   end
  # end
  # pairs[lowest_idx]

  # results = pairs.map { |subarray| subarray.reduce(:-).abs }
  lowest = pair_diff.min
  pairs[pair_diff.index(lowest)]
end

p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 7, 17]) == [12, 7]