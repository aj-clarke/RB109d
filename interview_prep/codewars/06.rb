=begin
Question:
Non-even substrings (12:24)
(https://www.codewars.com/kata/59da47fa27ee00a8b90000b4/train/ruby)
6 kyu
=begin
Given a string of integers, return the number of odd-numbered substrings that
can be formed.
For example, in the case of "1341", they are 1, 1, 3, 13, 41, 341, 1341, a total
of 7 numbers.
solve("1341") = 7

-----------------------
Rules:
  Explicit Requirements
  - Return number of odd-numbered substrings that can be formed.

  Implicit Requirements

-----------------------
Examples:
p solve("1341") == 7
p solve("1357") == 10
p solve("13471") == 12
p solve("134721") == 13
p solve("1347231") == 20
p solve("13472315") == 28

-----------------------
Modeling:
solve("13471") == 12

`substrings` will contain all substrings converted to integers from input `arr`

Iterate over input string (use range) to obtain substrings
[1,13,134,1347....71,1]

Select those that are odd, return count

-----------------------
Data Structure:
I: String
W: Array of substrings
O: Integer (count of odd substrings)

Algorithm:
< given a string `str` >

Initialize `substrings` to an empty array

Iterate over input string `str` with range of; from zero index to size of string - 1
  (outer iteration is for start of each substring)
  Iterate over input string `str` with range of; from `outer iteration` to the
  size of string - 1
    (inner iteration is for end of each substring)
    push into substrings the result of slicing a string from `outer` to `inner`
      ONLY PUSH IN IF THE SUBSTRING IS ODD

CHECK SUBSTRINGS

Return size if correct

-----------------------
Code:
=end

def solve(str)
  substrings = []
  (0...str.size).each do |outer|
    (outer...str.size).each do |inner|
      substrings << str[outer..inner].to_i if str[outer..inner].to_i.odd?
    end
  end
  substrings.size
end

p solve("1341") == 7
p solve("1357") == 10
p solve("13471") == 12
p solve("134721") == 13
p solve("1347231") == 20
p solve("13472315") == 28
