=begin
Question:

Took 30 mins on the nose

Given two words, how many letters do you have to remove from them to make them anagrams?
  Example
  First word : c od e w ar s (4 letters removed)
  Second word : ha c k er r a nk (6 letters removed)
  Result : 10
  Hints
  A word is an anagram of another word if they have the same letters (usually in a different order).
  Do not worry about case. All inputs will be lowercase.

-----------------------
Rules:
  Explicit Requirements
  - Determine how many letters need to be removed from each word (total) to make them anagrams
  - Case is not important

  Implicit Requirements

-----------------------
Examples:
p anagram_difference('codewars', 'hackerrank') == 10



-----------------------
Modeling:
'codewars', 'hackerrank' == 10

`str1` => 'codewars'
`str2` => 'hackerrank'

Init `hash1` equal to either each_char.with_object iteration, or #chars > #tally, to obtain letter/count (key/value) pairs
Init `hash2` the same way

`hash1` => {'c'=>1, 'o'=>1, 'd'=>1, 'e'=>1, 'w'=>1, 'a'=>1, 'r'=>1, 's'=>1}
`hash2` => {'h'=>1, 'a'=>2', 'c'=>1, 'k'=>2, 'e'=>1, 'r'=>2, 'n'=>1}

`hash1_dup` equals hash1 duplicated
`hash2_dup` equals hash2 duplicated

Init `total_count` = 0

Iterate `hash1_dup` 
  If the current `key` does not exist in `hash2`
    Add the `count` of that keys value to `total_count`
    Delete that key/value pair out of `hash1`

Iterate `hash2_dup` 
  If the current `key` does not exist in `hash1`
    Add the `count` of that keys value to `total_count`
    Delete that key/value pair out of `hash2``

# total_count should be = 8 
`hash1` => {'c'=>1, 'e'=>1, 'a'=>1, 'r'=>1}
`hash2` => {'a'=>2', 'c'=>1, 'e'=>1, 'r'=>2}

Iterate `hash1`
  Init `abs_val` to subtracting the current `hash1[key]` from `hash2[key]` and obtaining that absolute value
  Increment `total_count` by the `abs_val`

Return `total_count`

-----------------------

Data Structure:
I: String
W: Conversion to hashes for required counts
O: Integer depicting how many letters need to be removed to create an anagram

Algorithm:
< given two strings `str1`, `str2` >

Init `hash1` equal to either iterating each character of `str1` with a hash object to create a 'letter'/'count' pair
Init `hash2` the same way

`hash1_dup` equals hash1 duplicated
`hash2_dup` equals hash2 duplicated

Init `total_count` equal to 0

Iterate `hash1_dup` 
  If the current `key` does not exist in `hash2`
    Add the `count` of that keys value to `total_count`
    Delete that key/value pair out of `hash1`

Iterate `hash2_dup` 
  If the current `key` does not exist in `hash1`
    Add the `count` of that keys value to `total_count`
    Delete that key/value pair out of `hash2``

Iterate `hash1`
  Init `abs_val` to subtracting the current keys value from the keys value in `hash2` and obtaining that absolute value
  Increment `total_count` by the `abs_val`

Return `total_count`
-----------------------
Code:
=end

def anagram_difference(str1, str2)
  hash1 = str1.chars.tally
  hash2 = str2.chars.tally

  hash1_dup = hash1.dup
  hash2_dup = hash2.dup

  total_count = 0

  hash1_dup.each do |letter, count|
    if hash2[letter]
      next
    else
      total_count += count
      hash1.delete(letter)
    end
  end

  hash2_dup.each do |letter, count|
    if hash1[letter]
      next
    else
      total_count += count
      hash2.delete(letter)
    end
  end

  hash1.each do |letter, count|
    hash1[letter]
    hash2[letter]
    abs_val = (hash1[letter] - hash2[letter]).abs
    total_count += abs_val
  end
  total_count
end

p anagram_difference('', '') == 0
p anagram_difference('a', '') == 1
p anagram_difference('', 'a') == 1
p anagram_difference('ab', 'a') == 1
p anagram_difference('ab', 'ba') == 0
p anagram_difference('ab', 'cd') == 4
p anagram_difference('aab', 'a') == 2
p anagram_difference('a', 'aab') == 2
p anagram_difference('codewars', 'hackerrank') == 10
