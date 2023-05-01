=begin
Question:
Took 16:55 while dosing off
What adds up
Given three arrays of integers your task is to create an algorithm that finds the numbers in the first two arrays whose sum is equal to any number in the third. The return value should be an array containing the values from the argument arrays that adds up. The sort order of the resulting array is not important. If no combination of numbers adds up return a empty array.

-----------------------
Questions:

Rules:
  Explicit Requirements
  - Find nums in first two arrays that equal (sum to) any nm in the third array
  - Return an array containing the values from first two arrays and the num they equal (3 ele array)
  - Arr order doesnt matter
  - Return empty array if no combinations can be made

  Implicit Requirements

-----------------------
Examples:
A small example: Given the three input arrays a1 = [1, 2]; a2 = [4,3]; a3 = [6,5,8], we need to find the number pairs from a1 and a2 that sum up to a number in a3 and return those three numbers in an array. In this example, the result from the function would be [[1, 4, 5] , [2, 4, 6], [2, 3, 5]].

Given three arrays
a1      a2      a3
 1       4       6          (a1 a2 a3)    (a1 a2 a3)  (a1 a2 a3)
 2       3       5      =>  [[1, 4, 5] ,  [2, 4, 6],  [2, 3, 5]]
                 8
                 
each value in the result array contains one part from each of the arguments.
Testing
A function compare_array is given. This function takes two arrays and compares them invariant of sort order.

Test.expect(compare_arrays(addsup([1,2], [3,1], [5,4]), [[1,3,4], [2,3,5]]))

-----------------------
Modeling:
[1,2], [3,1], [5,4] == [[1,3,4], [2,3,5]]

`arr1` => [1,2]
`arr2` => [3,1]
`arr3` => [5,4] > any subarr summed included in `arr3`?

Init `subarrays` to an empty collection

Create `arr1`/`arr2` pairs:
  Iterate `arr1` |num1|
    Iterate `arr2` |num2|
      into `subarrays` push in, `num1`, `num2`, and `num1` + `num2` if their sum is equal to any in `arr3`

return `subarrays`

-----------------------
Data Structure:
I: 3 Arrays
W: Array of subarrays
O: Nested subarrays

Algorithm:
< given 3 arrays `arr1`, `arr2`, `arr3` >

Init `subarrays` to an empty collection

Create `arr1`/`arr2` pairs:
  Iterate `arr1` |num1|
    Iterate `arr2` |num2|
      into `subarrays` push in, `num1`, `num2`, and `num1` + `num2` if their sum is equal to any in `arr3`

return `subarrays`

-----------------------
Code:
=end

def addsup(arr1, arr2, arr3)
  subarrays = []

  arr1.each do |num1|
    arr2.each do |num2|
      subarrays << [num1, num2, num1 + num2] if arr3.include?(num1 + num2)
    end
  end
  subarrays
end

p addsup([1,2], [3,1], [5,4,6]) == [[1,3,4], [2,3,5]]