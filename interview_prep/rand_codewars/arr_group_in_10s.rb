=begin
Question:
Group In 10s
FIRST 25:50

Write a method groupIn10s which takes any number of arguments, groups them into tens, and sorts each group in ascending order.

The return value should be an array of arrays, so that numbers between 0 and 9 inclusive are in position 0, numbers between 10 and 19 are in position 1, etc.

-----------------------
Questions:

Rules:
  Explicit Requirements
  - Method takes any number of arguments, groups them into tens
  - Each group is sorted in ascending order
  - Return value should be an array of arrays
    - Nums 0 - 9 should be in index pos 0, 10 - 19 in pos 1, etc.

  Implicit Requirements
  - If a grouping does not have any elements, it should be assigned `nil`

-----------------------
Examples:
grouped = group_in_10s(8, 12, 38, 3, 17, 19, 25, 35, 50) 

grouped[0]     # [3, 8]
grouped[1]     # [12, 17, 19]
grouped[2]     # [25]
grouped[3]     # [35, 38]
grouped[4]     # nil
grouped[5]     # [50]

-----------------------
Modeling:
dup input arr, while input arr size is > 0 cycle dup and remove from input arr
8, 12, 38, 3, 17, 19, 25, 35, 50 == [ [ 3, 8 ], [ 12, 17, 19 ], [ 25 ], [ 35, 38 ], nil, [ 50 ]]

Use splat operator to assign inputs into an array `arr`

`arr` => [8, 12, 38, 3, 17, 19, 25, 35, 50]

Init `arr_dup` to `arr` duplicated/cloned

Init `result` to an empty collection

Init `grp_start` to 0
Init `grp_stop` to 9
START WHILE LOOP while `arr` size is > 0
  Init `temp_group`
  Iterate `arr_dup` |ele|
    IF `ele` is greater than/equal to `grp_start` && `ele` is less than/equal to `grp_stop`
      Into `temp_group` push `ele`
      Delete `ele` from `arr`
    END IF
  Into `result` push a sorted `temp_group` if not empty
  Into `result` push `nil` if empty
  Increment `grp_start` by 10
  Increment `grp_stop` by 10
END WHILE LOOP

Return `result`

-----------------------
Data Structure:
I: Array of arguments (via splat operator)
W: Array of subarrays (and possible `nil`'s) to hold results
O: Nested `result` array with input arguments placed int nested subarrays

Algorithm:
< given arguments for an array `arr` >

Init `arr_dup` to `arr` duplicated/cloned

Init `result` to an empty collection

Init `grp_start` to 0
Init `grp_stop` to 9
START WHILE LOOP while `arr` size is > 0
  Init `temp_group` an emtpy collection
  Iterate `arr_dup` |ele|
    IF `ele` is greater than/equal to `grp_start` && `ele` is less than/equal to `grp_stop`
      Into `temp_group` push `ele`
      Delete `ele` from `arr`
    END IF
  Into `result` push a sorted `temp_group` unless it's empty
  Into `result` push `nil` if empty
  Increment `grp_start` by 10
  Increment `grp_stop` by 10
END WHILE LOOP

Return `result`
-----------------------
Code:
=end

def group_in_10s(*arr)
  arr_dup = arr.dup
  result = []
  grp_start = 0
  grp_stop = 9

  while arr.size > 0
    temp_group = []

    arr_dup.each do |ele|
      if ele >= grp_start && ele <= grp_stop
        temp_group << ele
        arr.delete(ele)
      end
    end
    result << temp_group.sort unless temp_group.empty?
    result << nil if temp_group.empty?
    grp_start += 10
    grp_stop += 10
  end
  result
end

p group_in_10s( 1,2,3 ) == [ [ 1, 2, 3 ] ]
p group_in_10s( 8, 12, 38, 3, 17, 19, 25, 35, 50 ) == [ [ 3, 8 ], [ 12, 17, 19 ], [ 25 ], [ 35, 38 ], nil, [ 50 ]]
p group_in_10s( 12, 10, 11, 13, 25, 28, 29, 49, 51, 90 ) == [ nil, [ 10, 11, 12, 13 ], [ 25, 28, 29 ], nil, [ 49 ], [ 51 ], nil, nil, nil, [ 90 ] ]
p group_in_10s() == []
p group_in_10s(100) == [nil, nil, nil, nil, nil, nil, nil, nil , nil, nil, [ 100 ]]
