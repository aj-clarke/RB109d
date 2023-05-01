=begin
Question:
 Multiples of 3 or 5 (16:30)
(https://www.codewars.com/kata/514b92a657cdc65150000006/train/ruby)
6 kyu

If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
Finish the solution so that it returns the sum of all the multiples of 3 or 5 below the number passed in.
Note: If the number is a multiple of both 3 and 5, only count it once.

-----------------------
Questions:

Problem (Rewrite if needed else skip):
Obtain the all numbers below the input number that are multiples of 3 or 5. Return the sum of the multiples that are found.
If a number is a multiple of both, only count it once.

Input: Integer
Output: Integer (sum of unique multiples found)
Rules:
  Explicit Requirements
  - Obtain multiples of 3 or 5 for nubmers below the input Integer
  - Obtain sum of multiples that are found
    - Only count unique multiples once (only a 3, not 3 and 3)
    
  Implicit Requirements

-----------------------
Modeling:
Input => 10
Multiples are => 3, 5, 6, 9
  if integer returns 0 when using % operator for 3 or 5 then add it to array
Take mutiples and store in Array
Sum the unique integers in the array 

-----------------------
Examples:
p solution(10) == 23
p solution(20) == 78
p solution(200) == 9168

-----------------------
Scratch Pad:
set array to array.uniq
sum or reduce/inject

-----------------------
Data Structure:
I: Integer
W: Array of mutiples (ensure unique)
O: Integer (sum of multiples)

Algorithm:
< given an integer as input >

Initialize `multiples` to empty collection

Iterate from 1 to (input integer - 1) |int|
  Add the current `int` if the result of calling #% returns 0 for 3 or 5

Set `multiples` equal to the result of calling #uniq on self
    Chain on sum or reduce(:+)

-----------------------
Code:
=end

def solution(integer)
  multiples = []

  (1...integer).each do |int|
    multiples << int if (int % 3).zero? || (int % 5).zero?
  end

  multiples.uniq.reduce(:+) # Had to add .abs for codewars as it was inputing negative integers
end

#OR 

def solution(input_int)
  result = []

  (1...input_int).each do |int|
    result << int if (int % 3).zero? || (int % 5).zero?
  end
  result.sum
end

p solution(10) == 23
p solution(20) == 78
p solution(200) == 9168
