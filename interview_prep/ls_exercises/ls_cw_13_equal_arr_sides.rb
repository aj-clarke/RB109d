=begin
Equal sides of an array
SECOND: 19:50 | THIRD: 16:35
Question:
You are going to be given an array of integers. Your job is to take that array and find an index N where the sum of the integers to the left of N is equal to the sum of the integers to the right of N. If there is no index that would make this happen, return -1.

Input:
An integer array of length 0 < arr < 1000. The numbers in the array can be any integer positive or negative.

Output:
The lowest index N where the side to the left of N is equal to the side to the right of N. If you do not find an index that fits these rules, then you will return -1.

Note:
If you are given an array with multiple answers, return the lowest correct index.

-----------------------
Rules:
  Explicit Requirements
  - Find index position where sum to the left of that index is equal to the sum to the left of that index
  - DO NOT INCLUDE CURRENT INDEX WHEN CALCUALTING SUM
  - Return the index position that satisfies the requirements
  - If no index meets requirement, return -1

  Implicit Requirements

-----------------------
Examples:
Let's say you are given the array {1,2,3,4,3,2,1}: Your function will return the index 3, because at the 3rd position of the array, the sum of left side of the index ({1,2,3}) and the sum of the right side of the index ({3,2,1}) both equal 6.

Let's look at another one.
You are given the array {1,100,50,-51,1,1}: Your function will return the index 1, because at the 1st position of the array, the sum of left side of the index ({1}) and the sum of the right side of the index ({50,-51,1,1}) both equal 1.

Last one:
You are given the array {20,10,-80,10,10,15,35}
At index 0 the left side is {}
The right side is {10,-80,10,10,15,35}
They both are equal to 0 when added. (Empty arrays are equal to 0 in this problem)
Index 0 is the place where the left side and right side are equal.

-----------------------
Modeling:
[20,10,-80,10,10,15,35] == 0

Select index 0
idx 0...0 to create an empty array on left side, and from 1...end of array for right side

Select index 1
idx 0...1 to create 1 element array on left side, and from 2...end of array for right side


(0...arr.size).each do |current_idx|
arr[0...current_idx] - sum that then - arr[current_idx+1...arr.size] => 0 and 0
If they are equal, return current_idx

Return -1 implicitly if iteration finishes and nothing is returned

-----------------------
Data Structure:
I: Array
W: Iterating through array to find
O: Index pos where both sides equal 0 or -1 if req is not met

Algorithm:
< given an array `arr` >

Iterate through the Array |current_idx|
  Init `left` equal to the sum of elements from 0 to the `current_idx` (not inclusive)
  Init `right` equal to the sum of elements from the `current_idx` + 1 to the last element
  If `left` == `right` return `current_idx`

Return -1 implicitly if iteration finishes and nothing is returned from above iteration
-----------------------
Code:
=end

def find_even_index(arr)
  (0...arr.size).each do |current_idx|
    left = arr[0...current_idx].sum
    right = arr[(current_idx + 1)...arr.size].sum
    return current_idx if left.eql?(right)
  end
  -1
end

p find_even_index([1,2,3,4,3,2,1]) == 3
p find_even_index([1,100,50,-51,1,1]) == 1
p find_even_index([1,2,3,4,5,6]) == -1
p find_even_index([20,10,30,10,10,15,35]) == 3
p find_even_index([20,10,-80,10,10,15,35]) == 0
p find_even_index([10,-80,10,10,15,35,20]) == 6
p find_even_index(Array(1..100)) == -1
p find_even_index([0,0,0,0,0]) == 0
p find_even_index([-1,-2,-3,-4,-3,-2,-1]) == 3
p find_even_index(Array(-100..-1)) == -1