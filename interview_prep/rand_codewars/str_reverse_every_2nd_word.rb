=begin
Question:
Took 11:51

Reverse every other word the string
Reverse every other word in a given string, then return the string. Throw away any leading or trailing whitespace, while ensuring there is exactly one space between each word. Punctuation marks should be treated as if they are a part of the word in this kata.

-----------------------
Rules:
  Explicit Requirements
  - Reverse every other word in the string then return it
  - Remove leading/trailing whitespace, and only have 1 space between words
  - Treat punctuation (like a period) as if it is part of the word

  Implicit Requirements
  - Empty string returns empty string
-----------------------

Modeling:
"Reverse this string, please!" == "Reverse siht string, !esaelp"

`str` => "Reverse this string, please!"

Init `arr` to `str` converted to individual words in an array => ['Reverse', 'this'...]

Iterate each element in `arr` and trasnform destructively every second element starting from index position 1 (which is the second element) |word|
  Reverse the word destructively

Check `arr`

Rejoin `arr` with a space
-----------------------
Data Structure:
I: String
W: Array of words from input string to transform as needed
O: New string transformed as required

Algorithm:
< given a string `str` >

Init `arr` to `str` converted to individual words in an array

Iterate each element in `arr` and trasnform destructively every second element starting from index position 1 (which is the second element) |word|
  Reverse the word destructively

Check `arr`

Rejoin `arr` with a space

-----------------------
Code:
=end

def reverse_alternate(str)
  arr = str.split

  (1...arr.size).step(2) do |word_idx|
    arr[word_idx].reverse!
  end

  arr.join(' ')
end

p reverse_alternate('Did it work?') == 'Did ti work?'
p reverse_alternate('I really hope it works this time...') == 'I yllaer hope ti works siht time...'
p reverse_alternate('Reverse this string, please!') == 'Reverse siht string, !esaelp'
p reverse_alternate('Have a beer') == 'Have a beer'
p reverse_alternate('') == ''
p reverse_alternate('  Have a beer ') == 'Have a beer'
