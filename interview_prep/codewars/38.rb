=begin
Question:
20 minutes 
6 kyu
Given a string, return a new string that has transformed based on the input:

Change case of every character, ie. lower case to upper case, upper case to lower case.
Reverse the order of words from the input.
Note: You will have to handle multiple spaces, and leading/trailing spaces.

For example:

"Example Input" ==> "iNPUT eXAMPLE"
You may assume the input only contain English alphabet and spaces.

-----------------------
Rules:
  Explicit Requirements
  - Change the case of every character (lower to upper/upper to lower)
  - Reverse order of WORDS, NOT characters

  Implicit Requirements

-----------------------
Examples:
"Example Input" ==> "iNPUT eXAMPLE"

-----------------------
Modeling:
"Example Input" == "iNPUT eXAMPLE"

`str` => "Example Input"

Init `result` to `str` converted to an array of individual chars from `str`

Iterate `result` destructively |char|
  IF the current `char` is equal to `char` converted to lowercase
    Convert `char` to uppercase
  ELSE
    Convert `char` to lowercase
Join back to a string after end of iteration

`result` should equal => 'eXAMPLE iNPUT'

Convert `result` to an array of words split on spaces, reverse the words, then rejoin with a space

-----------------------
Data Structure:
I: String
W: Array of characters and words
O: New transformed string

Algorithm:
< given a string `str` >

Init `result` to `str` converted to an array of individual chars from `str`

Iterate `result` destructively |char|
  IF the current `char` is equal to a space
    Return the `char`
  ELSIF the current `char` is equal to `char` converted to lowercase
    Convert `char` to uppercase
  ELSE
    Convert `char` to lowercase
Join back to a string after end of iteration

`result` should equal => 'eXAMPLE iNPUT'

Convert `result` to an array of words split on spaces, reverse the words, then rejoin with a space
-----------------------
Code:
=end

def string_transformer(str)
  result = str.chars

  result.map! do |char|
    if char.eql?(' ')
      char
    elsif char.eql?(char.downcase)
      char.upcase!
    else char.eql?(char.upcase)
      char.downcase!
    end
  end.join.split.reverse.join(' ')

end

p string_transformer("Example Input") #== "iNPUT eXAMPLE"