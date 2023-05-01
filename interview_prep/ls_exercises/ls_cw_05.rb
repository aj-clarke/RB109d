=begin
SECOND PASS (12:05)
Non-even substrings

Question:
Given a string of integers, return the number of odd-numbered substrings that can be formed.

For example, in the case of "1341", they are 1, 1, 3, 13, 41, 341, 1341, a total of 7 numbers.

solve("1341") = 7. See test cases for more examples.

-----------------------
Questions:

Problem (Rewrite if needed else skip):

Input: String of integer characters
Output: Integer representing the count of all odd integer substrings
Rules:
  Explicit Requirements
  - Obtain substrings whos integer values are odd

  Implicit Requirements

-----------------------
Modeling:
"1341"
Get all substrings
['1', '13', '134', '1341', '3', '34', '341', '41', '1']
Transform to integers (map)
[1, 13, 134,...1]
Iterate and init result to just selecting odd substrings
return the count


-----------------------
Examples:
solve("1341") = 7

-----------------------
Scratch Pad:


-----------------------
Data Structure:
I: String of int chars
W: Array for substrings
O: Integer to represent count of odd integer substrings

Algorithm:

< given string as input >

Init `substrings` to empty collection

Iterate through the string (outer iteration)
  Iterate through the string (inner iteration)
    Push into `substrings` the defined substrings

Iterate through substrings and transform elements to integer substrings
  `substrings`.map! - substring.to_i
Initialize `result` to selecting substrings that have odd integer values
Return count of `result`

-----------------------
Code:
=end

def solve(str)
  substrings = []

  (0...str.size).each do |outer|
    (outer...str.size).each do |inner|
      substrings << str[outer..inner]
    end
  end
  substrings.map! { |substring| substring.to_i }

  result = substrings.select { |substring| substring.odd? }.count
end

p solve("1341") == 7
p solve("1357") == 10
p solve("13471") == 12
p solve("134721") == 13
p solve("1347231") == 20
p solve("13472315") == 28


=begin
SECOND PASS - Improved the modeling and code

Rules:
  Explicit Requirements
  - Return nubmer of odd-numbered substrings that can be formed

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
solve("1357") == 10

`substrings` to store them

Iterate the string for substring starting position |start| => (second pass) 1       => 3
  Iterate the string for substring ending position |end|   => (second pass) 1, 2, 3 => 3, 4, 1
    Push in each subarray (range) if after converting that range to an integer, it is an odd Integer

CHECK substrings => ['1','13','135','1357','3','35','357','5','57','7']
 
Return substrings array length => 10


-----------------------

Data Structure:
I: String
W: Array of substrings
O: Integer, substrings array count

Algorithm:
< given a string `str` >

Init `substrings` to an empty collection

Iterate the string for substring starting position |start|
  Iterate the string for substring ending position |end|
    Push in each subarray if after converting to an integer, it is an odd Integer

CHECK substrings
 
Return substrings array length
-----------------------
Code:
=end

def solve(str)
  substrings = []

  (0...str.size).each do |start_idx|
    (start_idx...str.size).each do |end_idx|
      substrings << str[start_idx..end_idx] if str[start_idx..end_idx].to_i.odd?
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