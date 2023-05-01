=begin
Question:
Took 15 mins (tooo slooooww)
Length of missing array

You get an array of arrays.
If you sort the arrays by their length, you will see, that their length-values are consecutive.
But one array is missing!

You have to write a method, that return the length of the missing array.

If the array of arrays is null/nil or empty, the method should return 0.

When an array in the array is null or empty, the method should return 0 too!
There will always be a missing element and its length will be always between the given arrays.

-----------------------
Questions:

Rules:
  Explicit Requirements
  - Sort arrays by length, they will be consecutive, but one is missing
  - Find the length of the missing array
  - If array of arrays is `nil` or empty, return 0
  - If a subarray is nil or empty, the method should return 0
  - An subarray will always be missing, and the length will always be between the given arrays.

  Implicit Requirements

-----------------------
Examples:
[[1, 2], [4, 5, 1, 1], [1], [5, 6, 7, 8, 9]] --> 3

-----------------------
Modeling:
[ [ 5, 2, 9 ], [ 4, 5, 1, 1 ], [ 1 ], [ 5, 6, 7, 8, 9 ]] ) == 2

`arr` => [ [ 5, 2, 9 ], [ 4, 5, 1, 1 ], [ 1 ], [ 5, 6, 7, 8, 9 ]]

If `arr` is empty, return 0

Init `sub_size` to 1

Sort `arr` /by/ the subarray lengths

Iterate `arr` to get a count of the |subarr| sizes
  return `sub_size` unless `subarr` size is equal to `sub_size`
  Increment `sub_size` by 1

-----------------------
Data Structure:
I: Array of arrays
W: Iteration of subarrays for comparison
O: The size of the missing subarray

Algorithm:
< given an array `arr` >
return 0 if `arr` is empty

Init `sub_size` to 1

Sort `arr` /by/ the subarray lengths

Iterate `arr` to get a count of the |subarr| sizes
  return `sub_size` unless `subarr` size is equal to `sub_size`
  Increment `sub_size` by 1

-----------------------
Code:
=end

def getLengthOfMissingArray(arr)
  return 0 if arr.empty?

  sub_size = 1

  arr = arr.sort_by { |subarr| subarr.size}

  arr.each do |subarr|
    return sub_size unless subarr.size.eql?(sub_size)
    sub_size += 1
  end

end

p getLengthOfMissingArray([ [ 1, 2 ], [ 4, 5, 1, 1 ], [ 1 ], [ 5, 6, 7, 8, 9 ]] ) == 3
p getLengthOfMissingArray([ [ 5, 2, 9 ], [ 4, 5, 1, 1 ], [ 1 ], [ 5, 6, 7, 8, 9 ]] ) == 2
p getLengthOfMissingArray([ [ false ], [ false, false, false ] ] ) == 2
p getLengthOfMissingArray([ [ 'a', 'a', 'a' ], [ 'a', 'a' ], [ 'a', 'a', 'a', 'a' ], [ 'a' ], [ 'a', 'a', 'a', 'a', 'a', 'a' ]] ) == 5
p getLengthOfMissingArray([]) == 0