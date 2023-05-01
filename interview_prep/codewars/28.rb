=begin
FIRST PASS 14:30 mins
What is an anagram? Well, two words are anagrams of each other if they both contain the same letters. For example:
'abba' & 'baab' == true
'abba' & 'bbaa' == true
'abba' & 'abbba' == false
'abba' & 'abca' == false
Write a function that will find all the anagrams of a word from a list. You will be given two inputs a word and an array with words. You should return an array of all the anagrams or an empty array if there are none.

-----------------------
Rules:
  Explicit Requirements
  - Find all anagrams of the provided word (str) in the array of strings
  - Return all anagrams, or an empty array if none exist

  Implicit Requirements

-----------------------
Examples:
p anagrams('abba', ['aabb', 'abcd', 'bbaa', 'dada']) == ['aabb', 'bbaa']
p anagrams('racer', ['crazer', 'carer', 'racar', 'caers', 'racer']) == ['carer', 'racer']
p anagrams('laser', ['lazing', 'lazy', 'lacer']) == []

-----------------------
Modeling:
'abba', ['aabb', 'abcd', 'bbaa', 'dada'] == ['aabb', 'bbaa']

`str` = 'abba'
`arr` = ['aabb', 'abcd', 'bbaa', 'dada']

`result` is empty arr

Take `str` and sort it => 'aabb'

Iterate `arr` | 'bbaa'
  If 'bbaa' converted to chars, sorted, rejoined, is == `str`
  add it to `result`

-----------------------

Data Structure:
I: String, array
W: Array to hold results
O: Result array of anagrams

Algorithm:
< given a string `str` and array `arr` >

Reassign `str` to `str` converted to an array of chars, sorted, then joined back into a string

Iterate `arr` |word| 
  Init `test_word` to  `word` converted to an array of chars, sorted, and rejoined to a string is equal to `str`
    If `test_word` is equal to `str`, add it to `result`

Return `result`

-----------------------
Code:
=end

def anagrams(str, arr)
  str = str.chars.sort.join

  result = []

  arr.each do |word|
    test_word = word.chars.sort.join
    result << word if test_word.eql?(str)
  end
  result
end

p anagrams('abba', ['aabb', 'abcd', 'bbaa', 'dada']) == ['aabb', 'bbaa']
p anagrams('racer', ['crazer', 'carer', 'racar', 'caers', 'racer']) == ['carer', 'racer']
p anagrams('laser', ['lazing', 'lazy', 'lacer']) == []
