=begin
Question:
Advanced Array Sort
FIRST: 11:14
Create a function that takes an array of numbers or strings and returns an array with the items from the original array stored into subarrays. Items of the same value should be in the same subarray.

Notes
The subarrays should be returned in the order of each element's first appearance in the given array.

-----------------------
Questions:

Rules:
  Explicit Requirements
  - Return an array with items from orinial array stored into subarrays
  - Same valued item should be in the same subarray
  - Subarray items should be in the order of each elements first appearence

  Implicit Requirements

-----------------------
Examples:
advanced_sort([2, 1, 2, 1]) == [[2, 2], [1, 1]]

advanced_sort([5, 4, 5, 5, 4, 3]) == [[5, 5, 5], [4, 4], [3]]

advanced_sort(["b", "a", "b", "a", "c"]) == [["b", "b"], ["a", "a"], ["c"]]

-----------------------
Modeling:
[2, 1, 2, 1] == [[2, 2], [1, 1]]

`arr` => [2, 1, 2, 1]

Init `subarrays` to an empty collection

Iterate `arr` to create subarrays that have equal values
  Nested iteration
    Init `temp_sub` to an empty collection
    Add elements to a `temp_sub` subarray and push them in after each iteration
  Push `temp_sub` into `subarrays`

Return all uniq `subarrays`


-----------------------
Data Structure:
I: Array of elements
W: Creating an array of equal value subarrays
O: Array of subarrays where each subarray contains equal values, and each subarray is unique

Algorithm:
< given an array `arr` >

Init `subarrays` to an empty collection

Iterate `arr` to create subarrays that have equal values
  Nested iteration
    Init `temp_sub` to an empty collection
    Add elements to a `temp_sub` subarray and push them in after each iteration
  Push `temp_sub` into `subarrays`

Return all uniq `subarrays`

-----------------------
Code:
=end

def advanced_sort(arr)
  subarrays = []

  (0...arr.size).each do |si|
    temp_sub = []
    (0...arr.size).each do |ei|
      temp_sub << arr[ei] if arr[ei].eql?(arr[si])
    end
    subarrays << temp_sub if !subarrays.include?(temp_sub)
  end
  subarrays#.uniq
end

p advanced_sort([2, 1, 2, 1]) == [[2, 2], [1, 1]]

p advanced_sort([5, 4, 5, 5, 4, 3]) == [[5, 5, 5], [4, 4], [3]]

p advanced_sort(["b", "a", "b", "a", "c"]) == [["b", "b"], ["a", "a"], ["c"]]