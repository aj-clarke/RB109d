=begin
Question:
Return an Array of Subarrays
FIRST: 16:15

Write a method that takes three arguments (subs, num_of_times, object) and returns an array containing x subarrays (e.g. [[], [], []]), each containing y number of item z.

x Number of subarrays contained within the main array.
y Number of items contained within each subarray.
z Item contained within each subarray.
Examples

Notes
The first two arguments will always be integers.
The third argument is either a string or an integer.

-----------------------
Questions:

Rules:
  Explicit Requirements
  - Return a new array with
    - The specified number of subarrays (first method param)
    - How many times that subarray will repeat (second method param)
    - What the element will be in each subarray (third method param)
  - Return the result of the above rules

  - First two input args will always be ints
  - Last input arg will be a string or an int

  Implicit Requirements

-----------------------
Examples:
p matrix(3, 2, 3) == [[3, 3], [3, 3], [3, 3]]
p matrix(2, 1, "edabit") == [["edabit"], ["edabit"]]
p matrix(3, 2, 0) == [[0, 0], [0, 0], [0, 0]]

-----------------------
Modeling:
2, 1, "edabit" == [["edabit"], ["edabit"]]

`sub_count` => 2
`ele_count` => 1
`object` => 'edabit'

Init `result` to an empty collection

Init `temp_sub` to an empty collection

`ele_count` times, Push into `temp_sub` the `object`

`sub_count` times, push into `result` the `temp_sub`

-----------------------
Data Structure:
I: 3 arguments: Two integers and either an int or a string
W: Building the required array
O: Result of building the output array

Algorithm:
< given 3 arguments `sub_count`, `ele_count`, and `object` >

Init `result` to an empty collection

Init `temp_sub` to an empty collection

`ele_count` times, Push into `temp_sub` the `object`

`sub_count` times, push into `result` the `temp_sub`

-----------------------
Code:
=end

def matrix(sub_count, ele_count, object)
  result = []
  temp_sub = []

  ele_count.times { temp_sub << object }

  sub_count.times { result << temp_sub }

  result
end

p matrix(3, 2, 3) == [[3, 3], [3, 3], [3, 3]]
p matrix(2, 1, "edabit") == [["edabit"], ["edabit"]]
p matrix(3, 2, 0) == [[0, 0], [0, 0], [0, 0]]
p matrix(3, 4, 0) == [[0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]]
p matrix(2, 3, "#") == [["#", "#", "#"], ["#", "#", "#"]]
p matrix(2, 3, -4) == [[-4, -4, -4], [-4, -4, -4]]
p matrix(1, 2, 0) == [[0, 0]]