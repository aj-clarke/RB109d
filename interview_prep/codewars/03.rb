=begin
Question:
Return substring instance count (15:23)
(https://www.codewars.com/kata/5168b125faced29f66000005/train/ruby)
7 kyu
=begin
Return substring instance count
Complete the solution so that it returns the number of times the `search_text`` is found within the full_text.
Usage example:
solution('aa_bb_cc_dd_bb_e', 'bb') # should return 2 since bb shows up twice
solution('aaabbbcccc', 'bbb') # should return 1

-----------------------
Rules:
  Explicit Requirements
  - Return the number of times the `search_text` is found within the input string `input_str`

  Implicit Requirements

-----------------------
Examples:
p solution('abcdeb','b') == 2
p solution('abcdeb', 'a') == 1
p solution('abbc', 'bb') == 1

-----------------------
Modeling:
('abcdeb','b') == 2 (only grab subtrings equal in length to the `search_text`)
substrings => ['a', 'b', 'c', 'd', 'e', 'b']

convert substrings to key/value where key is the char and value is the count
{ 'a'=>1, 'b'=>2, 'c'=>1, ... }

return the value of the `search_text` key


-----------------------
Scratch Pad:
get all substrings, set to keys, add counts if they show up multiple times, return count of the `search_text`

-----------------------
Data Structure:
I: String
W: Array of substrings > Hash of substrings as keys with count as values
O: Integer representing count of `search_text`

Algorithm:
< given a string `str` >

Initialize `substrings` to an empty collection

Iterate the input string to obtain substrings equal in legnth to the size of the search text

Convert substrings to a hash:
  key is the substring
  value is the count of the substring

Return the value of the `search_text` key
-----------------------
Code:
=end

def solution(str, search_text)
  substrings = []

  (0...str.size).each do |outer|
    (outer...str.size).each do |inner|
      substrings << str[outer..inner] if str[outer..inner].size.eql?(search_text.size)
    end
  end
  substrings = substrings.tally
  substrings[search_text]
end

p solution('abcdeb', 'b') == 2
p solution('abcdeb', 'a') == 1
p solution('abbc', 'bb') == 1
