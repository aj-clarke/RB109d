=begin
Question:
Are they the "same"? (24:50) : Second attempt (15:08)

(https://www.codewars.com/kata/550498447451fbbd7600041c)
6 kyu
Given two arrays a and b write a method comp(a, b) that checks whether the two arrays have the "same" elements, with the same multiplicities. "Same" means, here, that the elements in b are the elements in a squared, regardless of the order.
Examples
Valid arrays
a = [121, 144, 19, 161, 19, 144, 19, 11]
b = [121, 14641, 20736, 361, 25921, 361, 20736, 361]
comp(a, b) returns true because in b 121 is the square of 11, 14641 is the square of 121, 20736 the square of 144, 361 the square of 19, 25921 the square of 161, and so on. It gets obvious if we write b's elements in terms of squares:
a = [121, 144, 19, 161, 19, 144, 19, 11]
b = [11*11, 121*121, 144*144, 19*19, 161*161, 19*19, 144*144, 19*19]
Invalid arrays
If we change the first number to something else, comp may not return true anymore:
a = [121, 144, 19, 161, 19, 144, 19, 11]
b = [132, 14641, 20736, 361, 25921, 361, 20736, 361]
comp(a,b) returns false because in b 132 is not the square of any number of a.
a = [121, 144, 19, 161, 19, 144, 19, 11]
b = [121, 14641, 20736, 36100, 25921, 361, 20736, 361]
comp(a,b) returns false because in b 36100 is not the square of any number of a.
Remarks
a or b might be [] (all languages except R, Shell).
a or b might be nil or null or None or nothing (except in Haskell, Elixir, C++, Rust, R, Shell, PureScript).
If a or b are nil (or null or None), the problem doesn't make sense so return false.

-----------------------
Problem (Rewrite if needed else skip):


Rules:
  Explicit Requirements
  - Determine if arrays `a` and `b` are the "same"
    - "same" in reference to there being an element in `b` which is the value of a squared element from `a`. There must be a match for all of them.
  - Elements are not in any specific order
  - If either array is empty, or `nil` then return `false`
  - If the arrays are the "same", return `true`

  Implicit Requirements
  - Duplicate values can exist, account for them when validating if there is a match for every element in the first array `a`
-----------------------
Examples:
p comp([121, 144, 19, 161, 19, 144, 19, 11], [121, 14641, 20736, 361, 25921, 361, 20736, 361]) == true
p comp([121, 144, 19, 161, 19, 144, 19, 11], [132, 14641, 20736, 361, 25921, 361, 20736, 361]) == false
p comp(nil, [1, 2, 3]) == false
p comp([1, 2], []) == false
p comp([1, 2], [1, 4, 4]) == false

-----------------------
Modeling:
return false if either is `nil` or if either array is empty? or if arrays are not of equal size
[121, 144, 19, 161, 19, 144, 19, 11], [121, 14641, 20736, 361, 25921, 361, 20736, 361])
sort the array in ascending order

Check for all? to be true:
is `b` index equal to `a` index squared

If all are true, then return true, if not return false
-----------------------
Scratch Pad:
As iterating through `a`, delete specific element in `b` by indice?

-----------------------
Data Structure:
I: Two arrays
W: Two arrays (comparison occurs with sorting involved)
O: `true` or `false` boolean value

Algorithm:
< given two arrays `arr1`, `arr2` >
Return true if both arrays are empty
If either array is a nil input or if either array is empty or if array sizes are different; return false

Permanently sort both arrays

Return true if below returns true
Iterate through `arr2` with index position checking that all? criteria defined is true
  `arr1[index]` ** 2 is equal to `arr2[index]`

false

-----------------------
Code:
=end

# def comp(arr1, arr2)
#   return false if (arr1.nil? || arr2.nil?) || (arr1.size != arr2.size)
#   return true if arr1.empty? && arr2.empty?
#   return false if (arr1.empty? || arr2.empty?) 

#   arr1.sort!
#   arr2.sort!

#   return true if arr2.each_with_index.all? { |_, idx| (arr1[idx] **2) == arr2[idx] }

#   false
# end

# p comp([121, 144, 19, 161, 19, 144, 19, 11], [121, 14641, 20736, 361, 25921, 361, 20736, 361]) == true
# p comp([121, 144, 19, 161, 19, 144, 19, 11], [132, 14641, 20736, 361, 25921, 361, 20736, 361]) == false
# p comp(nil, [1, 2, 3]) == false
# p comp([1, 2], []) == false
# p comp([1, 2], [1, 4, 4]) == false

=begin
SECOND ATTEMPT

Problem (Rewrite if needed else skip):
Given 2 arrays, check to see if they are the 'same'
  - 'same' is equivalent to saying [11] == [121] because [11**2] == [121]
  - also has to have the same multiplicites (how many times a number is repeated in the arrays)

Rules:
  Explicit Requirements
  - Check to see if elements in array 1 squared equal that of the elements in array 2; both in the value of "squared" and in the count of how many times that result exists in array 2
  - Return true or false from the Method

  Implicit Requirements

-----------------------
Examples:
a = [121, 144, 19, 161, 19, 144, 19, 11]
b = [11*11, 121*121, 144*144, 19*19, 161*161, 19*19, 144*144, 19*19]

-----------------------
Modeling:
[121, 144, 19, 161, 19, 144, 19, 11]
[11*11, 121*121, 144*144, 19*19, 161*161, 19*19, 144*144, 19*19]

Sort them both =>
[11, 19, 19, 19, 121, 144, 144, 161]
[121, 361, 361, ... 25921]

Transform array 1 elements into thier value squared, then check to see if both arrays are equal; true or false would be the method return value

-----------------------

Data Structure:
I: Two arrays
W: Two arrays > transforming 1 array > array comparison
O: Boolean true or false

Algorithm:
< given two arrays `arr1`, `arr2`

Reassign `arr1` to `arr1` sorted
Reassign `arr2` to `arr2` sorted

Iterate through (transform destructively) `arr1`
  Multiply each element by itself (this would be return value of the block, transforming each element)

Check to see if `arr1` is equal to `arr2`
-----------------------
Code:
=end

def comp(arr1, arr2)
  return false if arr1.nil? || arr2.nil?
  arr1 = arr1.sort
  arr2 = arr2.sort

  arr1.map! { |int| int * int }

  arr1 == arr2
end

p comp([121, 144, 19, 161, 19, 144, 19, 11], [11*11, 121*121, 144*144, 19*19, 161*161, 19*19, 144*144, 19*19]) == true
p comp([],nil) == false
p comp([1, 2], [1, 4, 4]) == false