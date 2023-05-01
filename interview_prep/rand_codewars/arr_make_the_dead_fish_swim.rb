=begin
Question:
Make the Dead Fish Swim
FIRST: 16 mins
Write a simple parser that will parse and run Deadfish.

Deadfish has 4 commands, each 1 character long:

i increments the value (initially 0)
d decrements the value
s squares the value
o outputs the value into the return array
Invalid characters should be ignored.

parse("iiisdoso")  ==>  [8, 64]

-----------------------
Questions:

Rules:
  Explicit Requirements
  - Parse the input string, and follow the rules
  - `value` starts at 0
  - 'i' increments the value by 1
  - 'd' decrements the value by 1
  - 's' squares the value
  - 'o' pushes the value into the return array
  - Ignore all other chars
  - `value` does not reset when pushed into return array

  Implicit Requirements

-----------------------
Examples:
p parse("ooo") == ([0, 0, 0])
p parse("iiisdoso") == ([8, 64])
p parse("ioioio") == ([1, 2, 3])
p parse("idoiido") == ([0, 1])
p parse("isoisoiso") == ([1, 4, 25])
p parse("codewars") == ([0])

-----------------------
Modeling:
"iiisdoso" == ([8, 64])

`str` => "iiisdoso"
`value` => 0
"i i i s d  o  s   o"
 1 2 3 9 8 [8] 64  [8,64] 

Init `result` to an empty collection

Init `value` equal to 0
Iterate each char of the string `str` |char|
  Perform actions based on what the `char` is equal to
    When `case` is 'i'
      `value` equal to adding 1
    When `case` is 'd'
      `value` equal to subtracting 1
    When `case` is 's'
      `value` equal to squaring `value`
    When `case` is 'o'
      Into `result` push `value`
    If anything else
      Go to next iteration

-----------------------
Data Structure:
I: String
W: Iterating string, adding values to new Array
O: Array of integers

Algorithm:
< given a string `str` >

Init `result` to an empty collection

Init `value` equal to 0
Iterate each char of the string `str` |char|
  Perform actions based on what the `char` is equal to
    When `case` is 'i'
      `value` equal to adding 1
    When `case` is 'd'
      `value` equal to subtracting 1
    When `case` is 's'
      `value` equal to squaring `value`
    When `case` is 'o'
      Into `result` push `value`
    If anything else
      Go to next iteration

-----------------------
Code:
=end

def parse(str)
  result = []
  value = 0

  str.each_char do |char|
    case char
    when 'i'
      value += 1
    when 'd'
      value -= 1
    when 's'
      value = value **2
    when 'o'
      result << value
    else
      next
    end
  end
  result
end

p parse("ooo") == ([0, 0, 0])
p parse("iiisdoso") == ([8, 64])
p parse("ioioio") == ([1, 2, 3])
p parse("idoiido") == ([0, 1])
p parse("isoisoiso") == ([1, 4, 25])
p parse("codewars") == ([0])