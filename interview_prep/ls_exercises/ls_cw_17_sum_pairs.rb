=begin
Question:
Sum of Pairs

FIRST: 29:30 | SECOND: 21 mins | THIRD: 21 again | FOURTH: 16:15

Given a list of integers and a single sum value, return the first two values (parse from the left please) in order of appearance that add up to form the sum.

If there are two or more pairs with the required sum, the pair whose second element has the smallest index is the solution.

sum_pairs([11, 3, 7, 5],         10)
#              ^--^      3 + 7 = 10
== [3, 7]

sum_pairs([4, 3, 2, 3, 4],         6)
#          ^-----^         4 + 2 = 6, indices: 0, 2 *
#             ^-----^      3 + 3 = 6, indices: 1, 3
#                ^-----^   2 + 4 = 6, indices: 2, 4
#  * the correct answer is the pair whose second value has the smallest index
== [4, 2]

sum_pairs([0, 0, -2, 3], 2)
#  there are no pairs of values that can be added to produce 2.
== None/nil/undefined (Based on the language)

sum_pairs([10, 5, 2, 3, 7, 5],         10)
#              ^-----------^   5 + 5 = 10, indices: 1, 5
#                    ^--^      3 + 7 = 10, indices: 3, 4 *
#  * the correct answer is the pair whose second value has the smallest index
== [3, 7]
Negative numbers and duplicate numbers can and will appear.

-----------------------
Rules:
  Explicit Requirements
  - Return the first 2 values in order of appearance who add up to equal the given sum
  - If multiple solutions exist, the one with the lowest second element index postion wins

  Implicit Requirements
  - If no solutions exist, return `nil`

-----------------------
Examples:
l1 = [1, 4, 8, 7, 3, 15]
l2 = [1, -2, 3, 0, -6, 1]
l3 = [20, -13, 40]
l4 = [1, 2, 3, 4, 1, 0]
l5 = [10, 5, 2, 3, 7, 5]
l6 = [4, -2, 3, 3, 4]
l7 = [0, 2, 0]
l8 = [5, 9, 13, -3]

sum_pairs(l1, 8) == [1, 7]
sum_pairs(l2, -6) == [0, -6]
sum_pairs(l3, -7) == nil
sum_pairs(l4, 2) == [1, 1]
sum_pairs(l5, 10) == [3, 7]
sum_pairs(l6, 8) == [4, 4]
sum_pairs(l7, 0) == [0, 0]
sum_pairs(l8, 10) == [13, -3]

-----------------------
Modeling:
[5, 9, 13, -3], 10) == [13, -3]

subarrays = [] to store them


Iterate to create sub arrays that are 2 elements in size with the index |outer|
  Iterate again to add numbers to sub Array |inner|
    subarray << arr[outer], arr[inner], inner
  set subarrays equal to selecting each subarray that equals the input sum value

  select the subarray that has the lowest last element
  pop off the last elemnt and return subarray



-----------------------
Scratch Pad:


-----------------------
Data Structure:
I: Array and integer 
W: Subarrays
O: Array representing correct subarray that is equal in sum to the input integer

Algorithm:
< given an array `arr` and an integer `int` >


INitialize `subarrays`  to  an empty collection

Iterate through `arr` to create starting range |outer|
  Iterate through `arr` to create ending range |inner|
    Add the `outer` and `inner` `arr` elements to `subarrays`, and the `inner` value (represents idx position)

Reassign `subarrays` to iterating through and selecting those which have the first 2 elements equal to the input integer as a sum

return `nil` if `subarrays` is empty

Sort the array by the subarrays last element

Pop the last value off of `subarrays[0]``
return `subarrray[0]``



-----------------------
Code:
=end

def sum_pairs(arr, int)
  subarrays = []

  (0...arr.size).each do |outer|
    ((outer + 1)...arr.size).each do |inner|
      subarrays << [arr[outer], arr[inner], inner]
    end
  end

  subarrays = subarrays.select { |subarray| subarray[0] + subarray [1] == int }

  return nil if subarrays.empty?

  subarrays = subarrays.sort_by { |subarray| subarray.last }

  subarrays[0].pop
  subarrays[0]
end

l1 = [1, 4, 8, 7, 3, 15]
l2 = [1, -2, 3, 0, -6, 1]
l3 = [20, -13, 40]
l4 = [1, 2, 3, 4, 1, 0]
l5 = [10, 5, 2, 3, 7, 5]
l6 = [4, -2, 3, 3, 4]
l7 = [0, 2, 0]
l8 = [5, 9, 13, -3]

p sum_pairs(l1, 8) == [1, 7]
p sum_pairs(l2, -6) == [0, -6]
p sum_pairs(l3, -7) == nil
p sum_pairs(l4, 2) == [1, 1]
p sum_pairs(l5, 10) == [3, 7]
p sum_pairs(l6, 8) == [4, 4]
p sum_pairs(l7, 0) == [0, 0]
p sum_pairs(l8, 10) == [13, -3]


=begin
SECOND PASS

Rules:
  Explicit Requirements
  - Return first two arr elements in order of appearance that add up to form the input sum
  - If more than two meet this req, the pair whos second ele is a lower index wins
  - Negative numbers and duplicates can/will appear

  Implicit Requirements
  - If req is not met, return NIL
-----------------------
Examples:
sum_pairs([11, 3, 7, 5],         10)
#              ^--^      3 + 7 = 10
== [3, 7]

sum_pairs([4, 3, 2, 3, 4],         6)
#          ^-----^         4 + 2 = 6, indices: 0, 2 *
#             ^-----^      3 + 3 = 6, indices: 1, 3
#                ^-----^   2 + 4 = 6, indices: 2, 4
#  * the correct answer is the pair whose second value has the smallest index
== [4, 2]

sum_pairs([0, 0, -2, 3], 2)
#  there are no pairs of values that can be added to produce 2.
== None/nil/undefined (Based on the language)

sum_pairs([10, 5, 2, 3, 7, 5],         10)
#              ^-----------^   5 + 5 = 10, indices: 1, 5
#                    ^--^      3 + 7 = 10, indices: 3, 4 *
#  * the correct answer is the pair whose second value has the smallest index
== [3, 7]

-----------------------
Modeling:
l5= [10, 5, 2, 3, 7, 5]
sum_pairs(l5, 10) == [3, 7]

`pairs` is empty collection

Iterate input array `arr` for first index |first_idx|
  Iterate input array `arr` for second index |second_idx| don't select idx 0,0 or 1,1 etc.
    Push into `pairs` each pair and the last ele index arr|first_idx|, arr|second_idx|, second_idx IF the pairs sum is equal to the input integer

If `pairs` size is greater than 1
  Select the minimum value index of the second elements index position, and return the first two elements of that array
If `pairs` size is 1, then just return first two elements of the first subarray
ELSE return NIL



-----------------------
Data Structure:
I: Array of integers, and an integer
W: Array of 3 ele subarrays
O: Two element array

Algorithm:
< given an array `arr` and an integer `int` >

Init `pairs` to an empty collection

Iterate input array `arr` for first index |first_idx|
  Iterate input array `arr` for second index |second_idx| don't select idx 0,0 or 1,1 etc.
    Push into `pairs` each pair and the last ele index arr|first_idx|, arr|second_idx|, second_idx IF the pairs sum is equal to the input integer

If `pairs` size is greater than 1
  Select the minimum value index of the second elements index position, and return the first two elements of that array
If `pairs` size is 1, then just return first two elements of the first subarray
ELSE return NIL
-----------------------
Code:
=end

def sum_pairs(arr, int)
  pairs = []

  (0...arr.size).each do |first_idx|
    ((first_idx + 1)...arr.size).each do |second_idx|
      pairs << [arr[first_idx], arr[second_idx], second_idx] if (arr[first_idx] + arr[second_idx]).eql?(int)
    end
  end

  return pairs.min_by { |subarr| subarr[2] }[0..1] if pairs.size > 1

  return pairs[0..1] if pairs.size.eql?(1)

  nil
end

l1= [1, 4, 8, 7, 3, 15]
l2= [1, -2, 3, 0, -6, 1]
l3= [20, -13, 40]
l4= [1, 2, 3, 4, 1, 0]
l5= [10, 5, 2, 3, 7, 5]
l6= [4, -2, 3, 3, 4]
l7= [0, 2, 0]
l8= [5, 9, 13, -3]


# p sum_pairs(l1, 8) == [1, 7]
# p sum_pairs(l2, -6) == [0, -6]
# p sum_pairs(l3, -7) == nil
p sum_pairs(l4, 2) == [1, 1]
p sum_pairs(l5, 10) == [3, 7]
# p sum_pairs(l6, 8) == [4, 4]
# p sum_pairs(l7, 0) == [0, 0]
# p sum_pairs(l8, 10) == [13, -3]












#-------------------------------------------------------------------------------

=begin
FOURTH PASS

Rules:
  Explicit Requirements
  - Return first pair of values/elements that equal the input sum
  - If two or more pairs sum to the input sum, return the first pair whos second elements idx pos is lower
  - Negative nums and dups appear

  Implicit Requirements
  - Return `nil` if reqs are not met?

-----------------------
Examples:
sum_pairs([11, 3, 7, 5],         10)
#              ^--^      3 + 7 = 10
== [3, 7]

sum_pairs([4, 3, 2, 3, 4],         6)
#          ^-----^         4 + 2 = 6, indices: 0, 2 *
#             ^-----^      3 + 3 = 6, indices: 1, 3
#                ^-----^   2 + 4 = 6, indices: 2, 4
#  * the correct answer is the pair whose second value has the smallest index
== [4, 2]

sum_pairs([0, 0, -2, 3], 2)
#  there are no pairs of values that can be added to produce 2.
== None/nil/undefined (Based on the language)

sum_pairs([10, 5, 2, 3, 7, 5],         10)
#              ^-----------^   5 + 5 = 10, indices: 1, 5
#                    ^--^      3 + 7 = 10, indices: 3, 4 *
#  * the correct answer is the pair whose second value has the smallest index
== [3, 7]

-----------------------
Modeling:
l4= [1, 2, 3, 4, 1, 0]
p sum_pairs(l4, 2) == [1, 1]

[1, 2, 3, 4, 1, 0]
 ^-----------^     1 + 1 = 2, 2nd idx = 4 *
    ^-----------^  2 + 0 = 2, 2nd idx = 5

`arr` => [1, 2, 3, 4, 1, 0]
`input_sum` => 2

Init `subarrays` to an empty collection

Nested iterate `arr`
  From idx 0 to end of `arr` |first|
    From `first` + 1 to end of `arr` |second|
      Into `subarrays` push `arr` at idx `first``, `arr` at idx `second`, and `second` ONLY IF the 2 elements equal `input_sum`

CHEKC SUBARRAYS

Sort `subarrays` by the last array element, and return the first two elements from the first subarray

-----------------------
Data Structure:
I: Array and an integer (reps sum)
W: Array of subarrays (nested arrays)
O: Two element array which sum to the input integer

Algorithm:
< given an array `arr` and int `input_sum`

Init `subarrays` to an empty collection

Nested iterate `arr`
  From idx 0 to end of `arr` |first|
    From `first` + 1 to end of `arr` |second|
      Into `subarrays` push `arr` at idx `first`, `arr` at idx `second`, and `second` ONLY IF the 2 elements equal `input_sum`

CHEKC SUBARRAYS

Sort `subarrays` by the last array element, and return the first two elements from the first subarray

-----------------------
Code:
=end

def sum_pairs(arr, input_sum)
  subarrays = []

  (0...arr.size).each do |first|
    (first+1...arr.size).each do |second|
      subarrays << [arr[first], arr[second], second] if (arr[first] + arr[second]).eql?(input_sum)
    end
  end
  return nil if subarrays.empty?

  subarrays.sort_by { |subarray| subarray.last }.first[0..1]
  #OR
  subarrays.min_by { |subarray| subarray.last }[0..1]
end

l1= [1, 4, 8, 7, 3, 15]
l2= [1, -2, 3, 0, -6, 1]
l3= [20, -13, 40]
l4= [1, 2, 3, 4, 1, 0]
l5= [10, 5, 2, 3, 7, 5]
l6= [4, -2, 3, 3, 4]
l7= [0, 2, 0]
l8= [5, 9, 13, -3]

p sum_pairs(l1, 8) == [1, 7]
p sum_pairs(l2, -6) == [0, -6]
p sum_pairs(l3, -7) == nil
p sum_pairs(l4, 2) == [1, 1]
p sum_pairs(l5, 10) == [3, 7]
p sum_pairs(l6, 8) == [4, 4]
p sum_pairs(l7, 0) == [0, 0]
p sum_pairs(l8, 10) == [13, -3]
