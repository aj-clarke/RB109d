=begin
Question:
Scramblies (26:45) : Second attempt (19:38) : Third attempt (15:30)
(https://www.codewars.com/kata/55c04b4cc56a697bb0000048/train/ruby)
5 kyu
Complete the function scramble(str1, str2) that returns true if a portion of str1 characters can be rearranged to match str2, otherwise returns false.
Notes:
Only lower case letters will be used (a-z). No punctuation or digits will be included.
Performance needs to be considered

-----------------------
Questions:

Problem (Rewrite if needed else skip):
- Given 2 strings, return true if letters from string 1 can be rearranged to match string 2. If no, return false
- Only lowercase letters
- No punctuation or digits included
- Performance matters

Input: 2 strings
Output: `true` or `false`
Rules:
  Explicit Requirements
  - Characters from `str1` rearranged need to match `str2`
    - If they can, return `true`; return `fasle` if not
- Only lowercase letters
- No punctuation or digits included
- Performance matters

  Implicit Requirements

-----------------------
Modeling:
'katas', 'steak'
s, s ; t, t ; e, _ : Return false

'rkqodlw', 'world'
w, w ; o, o ; r, r ; l, l ; d, d : Return true
Iterate through `world` (str2)
for each letter
  Find index position of the letter in (str1), and 'delete_at' to remove that character out of `rkqodlw` (str1)
  If the return value of `index` is 'nil' then return 'false'
  If iteration completes, return `true`


-----------------------
Examples:
p scramble('katas', 'steak') == false
p scramble('rkqodlw', 'world') == true

-----------------------
Data Structure:
I: Two strings (str1, str2)
W: Manipulating `str1`
O: boolean value

Algorithm:
< given 2 strings as input `str1`, `str2`
Convert str1 to an array of single characters

Iterate through `str2`
  For each_char, Initialize `idx` to finding the index position of `char` from `str1`
  If the return value of `idx` is `nil` return `false`
  If not `false` #delete_at the `idx` position in `str1`

After iteration is complete set implicit `true` as the last line to evaluate in method


-----------------------
Code:
=end

def scramble(str1, str2)
  str1 = str1.chars
  str2.each_char do |char|
    idx = str1.index(char)
    return false if idx.nil?

    str1.delete_at(idx)
  end
  true
end

p scramble('katas', 'steak') == false
p scramble('rkqodlw', 'world') == true
p scramble('cedewaraaossoqqyt', 'codewars') == true
p scramble('katas', 'steak') == false
p scramble('scriptjava', 'javascript') == true
p scramble('scriptingjava', 'javascript') == true


=begin
SECOND ATTEMPT
-----------------------
Rules:
  Explicit Requirements
  - Return true if portion of string 1, contains characters to create string 2
  - Return false if not

  Implicit Requirements

-----------------------
Examples:
scramble('rkqodlw', 'world') == true
scramble('cedewaraaossoqqyt', 'codewars') == true
scramble('katas', 'steak') == false
scramble('scriptjava', 'javascript') == true
scramble('scriptingjava', 'javascript') == true

-----------------------
Modeling:
'rkqodlw', 'world' == true
[r,k,q,o,d,l,w], [w,o,r,l,d]
hsh1 {r=>1, k=>1, q=>1...}, hsh2 {w=>1,o=>1....}

-----------------------

Data Structure:
I: String
W: Array of chars for each string > Hash with char as key, and count of chars as value for each string > then compare
O: True or False which is based on whether all required chars to create `string 2` are availabe in `string 1`

Algorithm:
< given 2 strings `str1`, `str2` >

Reassign `str1` to array of /chars/ > hash of char counts with key being the char
Reassign `str2` to array of /chars/ > hash of char counts with key being the char

Iterate through `str2` to validate that /ALL/ characters in string 2, are also in string 1 AND that the count of each character in string 1 is equal or less than what is in string 2

-----------------------
Code:
=end

def scramble(str1, str2)
  str1 = str1.chars.tally
  str2 = str2.chars.tally
  str2.keys.all? do |char, _|
    str1[char] && str1[char] >= str2[char]
  end
end

p scramble('rkqodlw', 'world') == true
p scramble('cedewaraaossoqqyt', 'codewars') == true
p scramble('katas', 'steak') == false
p scramble('scriptjava', 'javascript') == true
p scramble('scriptingjava', 'javascript') == true



=begin
THIRD ATTEMPT

Rules:
  Explicit Requirements
  - Return true if a portion of str1 chars chan be rearranged to match str2; otherwise, return false
  - Only lowercase letters used
  - No punctuation or digits included

  Implicit Requirements

-----------------------
Examples:
p scramble('rkqodlw', 'world') == true
p scramble('cedewaraaossoqqyt', 'codewars') == true

-----------------------
Modeling:
'rkqodlw', 'world' == true
Convert both input strings to hash key/value pairs  (key is char, value is count)

Itertate both with a hash Object
  Add one two the current hash keys value

hash1 => {r=>1, k=>1, q=>1, o=>1...}
hash2 => {w=>1, o=>1, r=>1, l=>1, d=>1}

Iterate through hash2
  If the keys value in hash1 is less than the keys value in hash2, return false
end

true

-----------------------
Data Structure:
I: Two strings
W: Two hashes to compare key/values
O: True or False boolean

Algorithm:
< given two strings `str1`, `str2` >

Init hash1 to iterating through EACH CHAR of `str1` with a hash object |char|
  Set hash1 |char| key to increasing the value by 1

Init hash2 to iterating through EACH CHAR of `str2` with a hash object |char|
  Set hash2 |char| key to increasing the value by

Iterate through hash2
    If the keys value in hash1 is less than the keys value in hash2, return false
end

true
-----------------------
Code:
=end

def scramble(str1, str2)
  hash1 = str1.each_char.with_object(Hash.new(0)) do |char, hash|
    hash[char] += 1
  end
  hash2 = str2.each_char.with_object(Hash.new(0)) do |char, hash|
    hash[char] += 1
  end

  hash2.each do |char, count|
    return false if hash2[char] > hash1[char]
  end
  true
end