=begin
Question:
 Detect Pangram
 FIRST: 18:30 | SECOND: 15ish | THIRD: 17:45 | FOURTH: 10:30
(https://www.codewars.com/kata/545cedaa9943f7fe7b000048/train/ruby)
6 kyu

A pangram is a sentence that contains every single letter of the alphabet at least once. For example, the sentence "The
quick brown fox jumps over the lazy dog" is a pangram, because it uses the letters A-Z at least once (case is irrelevant).
Given a string, detect whether or not it is a pangram. Return True if it is, False if not. Ignore numbers and punctuation.

-----------------------

Problem (Rewrite if needed else skip):

Input: String
Output: `true` or `false` boolean result
Rules:
  Explicit Requirements
  - Determine if input string is a pangram
    - pangram is a sentance that uses every letter of alphabet at least once.
  - Return boolean `true` if it is a pangram; `false` if not.
  - Ignore numbers and punctuations

  Implicit Requirements

-----------------------
Modeling:
("The quick brown fox jumps over the lazy dog.") => pangram
create an array of letters from ('a'..'z').to_a (var name `alpha`)
Iterate through each character of string deleting the current `char` from `alpha`
After iteration, return `true` if `arr` is empty; `false` if not
-----------------------
Examples:
p pangram?("The quick brown fox jumps over the lazy dog.") == true
p pangram?("This is not a pangram.") == false

-----------------------
Scratch Pad:
arr.empty?
arr.size.eql?(0)
ternary for `true` `false`
-----------------------
Data Structure:
I: String
W:
  Array for alpha characters
  String iteration
O: Boolean result

Algorithm:
< given a string as input >

Initialize `alpha` to array of alphabetic characters

Permanently downcase the string

Iterate through input String |char|
  Delete each `char` from the array

Check if array is empty. If it is return `true` (it is a pangram), else return `false` (not a pangram)

-----------------------
Code:
=end

def pangram?(str)
  alpha = ('a'..'z').to_a
  str = str.downcase

  str.each_char do |char|
    alpha.delete(char)
  end

  alpha.empty? ? true : false
end

p pangram?("The quick brown fox jumps over the lazy dog.") == true
p pangram?("This is not a pangram.") == false

#-----------------------------------------------------
=begin (I think about 15 mins)
Rules:
  Explicit Requirements
  - Detect whether an input string is a pangram (contains every letter of the alphabet)
  - Return true if yes, false if no

  Implicit Requirements

-----------------------
Examples:
'The quick brown fox jumps over the lazy dog.' => true

-----------------------
Modeling:
'The quick brown fox jumps over the lazy dog.'
Need array of letters (downcased)
Downcase input string as well.
Convert input string to an array of characters
Remove any character that is not in the array of letters.

Subtract the input string (converted to an array) from the alpha array

-----------------------

Data Structure:
I: String
W: Array of string characters, and array of alphabet characters
O: Boolean true or false

Algorithm:
< given a string `str` >

Create an alpha array (lowercase)

Reassign `str` to `str` equal to downcase

Initialize `str_arr` to `str` characters

Reassign `str_arr` to selecting only characters if they are included in alpha array

Perform `alpha` array minus `str_arr` to validate if `alpha` is empty
If alpha is empty, it is a panagram, otherwise it is not
Return true or false based on above

-----------------------
Code:
=end
ALPHA = ('a'..'z').to_a

def pangram?(str)
  str = str.downcase
  str_arr = str.chars
  str_arr = str_arr.select { |char| ALPHA.include?(char) }
  (ALPHA - str_arr).eql?([]) ? true : false
end

#----OR

def panagram?(str)
  str = str.downcase
  alpha = ('a'..'z').to_a
  test_arr = []

  str.each_char { |char| test_arr << char if alpha.include?(char) }
  (alpha - test_arr).eql?([]) ? true : false
end

p pangram?('The quick brown fox jumps over the lazy dog.') #== true





#-------------------------------------------------------------------------------
=begin
FOURTH

Modeling:
"The quick brown fox jumps over the lazy dog." == true

`str` => "The quick brown fox jumps over the lazy dog."

Init `alpha_chars` to an array of lowercase letters `a` to `z`

Reassign `str` to downcased

Set `str` equal to slicing the last index off of the string

Subtract arrays: `alpha_chars` - `str`

If `alpha_chars` emtpy, return true, else false

-----------------------
Data Structure:
I: String
W: Array of alpha characters, and Manipulating string
O: True or False (pangram or not?)

Algorithm:
< given a string `str` >

Init `alpha_chars` to an array of lowercase letters `a` to `z`

Reassign `str` to downcased

Set `str` equal to slicing the last index off of the string

Subtract arrays: `alpha_chars` - `str`

If `alpha_chars` emtpy, return true, else false
-----------------------
Code:
=end

def pangram?(str)
  alpha_chars = ('a'..'z').to_a
  str = str.downcase[0...-1]
  alpha_chars -= str.chars

  alpha_chars.empty? ? true : false
end

p pangram?("The quick brown fox jumps over the lazy dog.") == true
p pangram?("This is not a pangram.") == false