=begin
Question:
 Transform To Prime
(https://www.codewars.com/kata/5a946d9fba1bb5135100007c/train/ruby)
6 kyu

FIRST: (?) | SECOND: 19:50 | THIRD: 14:09

Given a List [] of n integers , find the minimum number to be inserted in a list, so that the sum of all elements of the list should equal the closest prime number .
Notes
List size is at least 2 .
List's numbers will only have positives (n > 0) .
Repetition of numbers in the list could occur .
The newer list's sum should equal the closest prime number .
Input >> Output Examples
1- minimumNumber ({3,1,2}) ==> return (1)
Explanation:
Since , the sum of the list's elements equal to (6) , the minimum number to be inserted to transform the sum to prime number is (1) , which will make *the sum of the List** equal the closest prime number (7)* .
2- minimumNumber ({2,12,8,4,6}) ==> return (5)
Explanation:
Since , the sum of the list's elements equal to (32) , the minimum number to be inserted to transform the sum to prime number is (5) , which will make *the sum of the List** equal the closest prime number (37)* .
3- minimumNumber ({50,39,49,6,17,28}) ==> return (2)
Explanation:
Since , the sum of the list's elements equal to (189) , the minimum number to be inserted to transform the sum to prime number is (2) , which will make *the sum of the List** equal the closest prime number (191)* .

-----------------------
Questions:

Problem (Rewrite if needed else skip):
- Given a list of integers, first obtain the sum
  - Then find the correct integer that needs to be added to the current sum to make the `new sum` a prime number
  - The original sum could be a prime number and not need to be incremented

Input: Array
Output: Integer
Rules:
  Explicit Requirements
  - Obtain the sum of the input Array
  - If the above sum is not a prime number, find the correct integer needed to add to the sum to make it a prime number
  - List size is at least 2 .
  - List's numbers will only have positives (n > 0) .
  - Repetition of numbers in the list could occur .

  Implicit Requirements
  - If no number is needed to get to a prime number, return 0
-----------------------
Examples:


-----------------------
Modeling:

[2,12,8,4,6] == 5
Total of array is 32
Next prime number is 37

Check to see if 32 is a prime number
  if it is, return it
  if it isnt, add a count of 1 to a placeholder incrementer
  if it isnt, add one to the current sum

Check to see if 33 is a prime number
  if it is, return it
  if it isnt, add a count of 1 to a placeholder incrementer
  if it isnt, add one to the current sum
.
.
.
Check to see if 37 is a prime number
  if it is, return it

-----------------------
Scratch Pad:
If using modulus on number gets a 0 for only 1 and the number itself, it is a prime number

-----------------------
Data Structure:
I: Array of integers
W: Looping mechanism with the Array
O: Integer

Algorithm:
< given an array `arr` >

Initialize `sum` to the sum of the `arr`
Initialize `increment` to 0

Start a loop
  If any? return a 0 value with modulus called
    add 1 to sum
    add 1 to increment

  Otherwise
    return increment
  
-----------------------
Code:
=end

def minimum_number(arr)
  sum = arr.reduce(:+)
  increment = 0

  loop do
    if (2...sum).any? { |num| sum % num == 0 }
      increment += 1
      sum += 1
    else
      return increment
    end
  end
end

#-------------------------------------------------------------------------------
# OR

def minimum_number(arr)
  current_sum = arr.sum
  incremented_by = 0

  loop do
    return incremented_by unless (2...current_sum).any? { |num| current_sum % num == 0 }
    current_sum += 1
    incremented_by += 1
  end
end

p minimum_number([3,1,2]) == 1
p minimum_number([5,2]) == 0
p minimum_number([1,1,1]) == 0
p minimum_number([2,12,8,4,6]) == 5
p minimum_number([50,39,49,6,17,28]) == 2
p minimum_number([2,2])