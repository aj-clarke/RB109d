=begin
Question:
Persistence
FIRST PASS (21:24)
Write a function, persistence, that takes in a positive parameter num and returns its multiplicative persistence, which is the number of times you must multiply the digits in num until you reach a single digit.

For example:

 persistence(39) # returns 3, because 3*9=27, 2*7=14, 1*4=4
                 # and 4 has only one digit

 persistence(999) # returns 4, because 9*9*9=729, 7*2*9=126,
                  # 1*2*6=12, and finally 1*2=2

 persistence(4) # returns 0, because 4 is already a one-digit number

-----------------------
Rules:
  Explicit Requirements
  - Return the input integers multiplicative persistence.
    - Definition - number of times you must multiply the digits in the number until you reach a single digit
  - If the input integer is a single digit, return 0

  Implicit Requirements

-----------------------
Examples:
p persistence(39) == 3
p persistence(4) == 0
p persistence(25) == 2
p persistence(999) == 4

-----------------------
Modeling:
(39) == 3

If input integer `int` is less than 10, return 0

Set `intervals` to 0 (count how many times the loop has to occur for result)

Until int < 10
  Convert int to string, then to individual chararcters, then map those back to integers in the array, then multiplying the array integers together.
  if int < 10
    return `intervals`

-----------------------
Data Structure:
I: Integer
W: Array of chars > integers
O: Integer

Algorithm:
< given an integer `int` >

RETURN 0 if `int` is < 10

Init `intervals` to 0

UNTIL `int` is less than 10:
  Convert int to string, then to individual chararcters, then transform those back to integers in the array, then multiply the two element array integers together.
  increment `intervals` by 1
  IF `int` is less than 10
    Return `intervals`

-----------------------
Code:
=end

def persistence(int)
  return 0 if int < 10

  intervals = 0
  until int < 10
    int = int.to_s.chars.map!(&:to_i).reduce(:*)
    intervals += 1
    if int < 10
      return intervals
    end
  end
end

p persistence(39) #== 3
p persistence(4) #== 0
p persistence(25) #== 2
p persistence(999) #== 4
