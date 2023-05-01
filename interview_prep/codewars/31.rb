=begin
Question:
5 min 20 seconds
An anagram is the result of rearranging the letters of a word to produce a new word (see wikipedia).

Note: anagrams are case insensitive

Complete the function to return true if the two arguments given are anagrams of each other; return false otherwise.

-----------------------
Rules:
  Explicit Requirements
  - Return true if the two input strings are anagrams of one another, false if not

  Implicit Requirements
  - Case does not matter when checking

-----------------------
Examples:
"foefet" is an anagram of "toffee"

"Buckethead" is an anagram of "DeathCubeK"

-----------------------
Modeling:
'Creative', 'Reactive') == true

`str1` => 'Creative'
`str2` => 'Reactive'

Reassign `str1` equal to sorting destuctively, and downcasing the string
Reassign `str2` equal to sorting destuctively, and downcasing the string

Return true if `st1` equal to `str1`; false if not
-----------------------

Data Structure:
I: Two strings
W:
O: Boolean true or false depending on if the two words are anagrams

Algorithm:
< given two strings `str1`, `str2` >

Reassign `str1` and downcasing, converting to chars (an array), sorting the array, then rejoining the array
Reassign `str2` and downcasing, converting to chars (an array), sorting the array, then rejoining the array

Return true if `st1` equal to `str1`; false if not
-----------------------
Code:
=end

def is_anagram(str1, str2)
  str1 = str1.downcase.chars.sort.join
  str2 = str2.downcase.chars.sort.join

  str1.eql?(str2) ? true : false
end

p is_anagram('Creative', 'Reactive') == true
p is_anagram("foefet", "toffee") == true
p is_anagram("Buckethead", "DeathCubeK") == true
p is_anagram("Twoo", "WooT") == true
p is_anagram("dumble", "bumble") == false
p is_anagram("ound", "round") == false
p is_anagram("apple", "pale") == false
