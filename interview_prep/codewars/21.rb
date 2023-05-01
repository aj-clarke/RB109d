=begin
Question:
Find the Mine!
FIRST PASS: 15:10

You've just discovered a square (NxN) field and you notice a warning sign. The sign states that there's a single bomb in the 2D grid-like field in front of you.

Write a method mineLocation that accepts a 2D array, and returns the location of the mine. The mine is represented as the integer 1 in the 2D array. Areas in the 2D array that are not the mine will be represented as 0s.

The location returned should be an array where the first element is the row index, and the second element is the column index of the bomb location (both should be 0 based). All 2D arrays passed into your method will be square (NxN), and there will only be one mine in the array.

-----------------------
Rules:
  Explicit Requirements
  - Return the location of the "mine" (the index location of the integer 1 in the nested array)

  Implicit Requirements

-----------------------
Modeling:
[[0, 0, 0], [0, 0, 0], [0, 1, 0]] == [2, 1]

Iterate through the input array for the nested array index |outer_arr_idx|
[0, 0, 0] => 0
[0, 0, 0] => 1
[0, 1, 0] => 2
  Iterate through each `outer_arr_idx` for the element index |ele_idx|
  Fast forward to `outer_arr_idx` (2)
  0 => 0
  1 => 1
  0 => 0 - shouldnt get here
    IF `outer_arr_idx` at `ele_idx` == 1
      return a two element array of `outer_arr_idx`, `ele_idx`



-----------------------
Data Structure:
I: Nested array
W: Iteration to create a two element array
O: Two element array depicting the `mine` location

Algorithm:
< given an array `arr` >

Iterate through the input array for the nested array index |outer_arr_idx|
  Iterate through each `outer_arr_idx` for the element index |ele_idx|
    IF `outer_arr_idx` at `ele_idx` == 1
      return a two element array of `outer_arr_idx`, `ele_idx`
-----------------------
Code:
=end

def mineLocation(arr)
  (0...arr.size).each do |outer_arr_idx|
    (0...arr[outer_arr_idx].size).each do |ele_idx|
      return [outer_arr_idx, ele_idx] if arr[outer_arr_idx][ele_idx].eql?(1)
    end
  end
end

p mineLocation( [ [1, 0, 0], [0, 0, 0], [0, 0, 0] ] ) == [0, 0]
p mineLocation( [ [0, 0, 0], [0, 1, 0], [0, 0, 0] ] ) == [1, 1]
p mineLocation( [ [0, 0, 0], [0, 0, 0], [0, 1, 0] ] ) == [2, 1]
p mineLocation([ [1, 0], [0, 0] ]) == [0, 0]
p mineLocation([ [1, 0, 0], [0, 0, 0], [0, 0, 0] ]) == [0, 0]
p mineLocation([ [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 1, 0], [0, 0, 0, 0] ]) == [2, 2]