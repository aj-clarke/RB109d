=begin
Question:
6 kyu
Highest Scoring Word

FIRST ATTEMPT: 21mins 25 secs

Given a string of words, you need to find the highest scoring word.

Each letter of a word scores points according to its position in the alphabet: a = 1, b = 2, c = 3 etc.

You need to return the highest scoring word as a string.

If two words score the same, return the word that appears earliest in the original string.

All letters will be lowercase and all inputs will be valid.

-----------------------
Rules:
  Explicit Requirements
  - Find highest scoring word based off of alpha positions
  - Return highest scoring word as a string
  - Return first word that appears if multiple are the same

  Implicit Requirements

-----------------------
Examples:


-----------------------
Modeling:
'man i need a taxi up to ubud' == 'taxi'

Init `alpha_values` to hash of alhpa chars and their values from 1 - 26

`words` equal input string converted to array of words

`word_values` equal to transforming each word in words |word|
  Convert `word` to an array of chars
  Map in place each `char` to convert it to that chars hash value
    Sum the array of integers

`words` =       ['man','i','need','a','taxi']
`word_values` = [ 28,   9,  28,    1,  54...]
`max_value` = `word_values` max
Init `result_idx` to Find the index of the `word_values` `max_value`
Return `words` `result_idx`

-----------------------

Data Structure:
I: String
W:
  - Hash of alpha chars with their cooresponding values
  - Array of words
  - Array of chars
  - Array of word values
O: Word with the highest value

Algorithm:
< given a string `str` >

Init `alpha_values` to hash of alhpa chars and their values from 1 - 26
Init `words` to the `str` converted to an array of words

Init `word_values` to transforming each word in words |word|
  Convert `word` to an array of chars
  Map in place each `char` to convert it to that chars hash value
    Sum the array of integers

Init `max_value` equal to finding the /max/ value in the `word_values` array
Init `result_idx` to finding the index of the `word_values` `max_value`
Return `words` ad the `result_idx` index
-----------------------
Code:
=end

def high(str)
  alpha_values = ('a'..'z').zip(1..26).to_h
  words = str.split

  word_values = words.map do |word|
    word = word.chars.map { |char| alpha_values[char] }.reduce(:+)
  end
  max_value = word_values.max
  result_idx = word_values.index(max_value)
  words[result_idx]
end

p high('man i need a taxi up to ubud') == 'taxi'
p high('what time are we climbing up the volcano') == 'volcano'
p high('take me to semynak') == 'semynak'
p high('aaa b') == 'aaa'
