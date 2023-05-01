=begin
Question:
Split Strings (27:48)
(https://www.codewars.com/kata/515de9ae9dcfc28eb6000001)
6 kyu
Complete the solution so that it splits the string into pairs of two characters. If the string contains an odd number of
characters then it should replace the missing second character of the final pair with an underscore ('_').

-----------------------
Rules:
  Explicit Requirements
  - Split the input string into pairs of two characters
  - If string is an odd number of characters, the last pair should have a `_` as the second element

  Implicit Requirements
  - Empty string returns empty array

-----------------------
Examples:
solution('abc') == ['ab', 'c_']
solution('abcdef') == ['ab', 'cd', 'ef']
solution("abcdef") == ["ab", "cd", "ef"]
solution("abcdefg") == ["ab", "cd", "ef", "g_"]
solution("") == []

-----------------------
Modeling:
'abcdefg') == ['ab', 'cd', 'ef', 'g_']

break string into into array (chars)
['a', 'b', 'c', 'd', 'e', 'f', 'g']

Single iteration > push pairs into a new array `result`

range from 0...arr.size (not inclusive) |char| (char will represent idx)
  
[idx 0..1] => 'ab'

[idx 2..3] => 'cd'

[idx 3..4] => 'ef'

[idx 5..'_'] => 'g_'

during iteration have a new empty string variable `build_str`
  push char into `build_str`
  push `build_str` into `result` array if `build_str`s size is 2
  If `build_str` size is 1, but we are on the last iteration, push it into `result`
  reset `build_str` to an empty string

check the last element of the `result` array. If its size is 1, push in a '_'

return `result`

-----------------------
Data Structure:
I: String
W: Array of input string chars and a result array for the pairs
O: Restul array of pairs

Algorithm:
< given a string `str` >
Return an empty array if the input string is empty
Initialize `result` to an empty array
Initialize `str_arr` to `str` converted to array of characters (chars)
Initialize `build_str` to an empty String

Iterate through `str_arr` with a range to use the range integers as index position
  Push the current character `char` into `build_str`
  IF the size of `build_str` is 2, push into `result`
  If on the last iteration (check) arr size vs index, and `build_str` is 1
    push '_' into `build_str` and push into `result`
  Reset build_str if size is 2

return result


-----------------------
Code:
=end

def solution(str)
  return [] if str.empty?

  result = []
  build_str = ''

  str_arr = str.chars
  (0...str_arr.size).each do |idx|
    build_str << str_arr[idx]
    result << build_str if build_str.size.eql?(2)
    if idx == str_arr.size - 1 && build_str.size.eql?(1)
      build_str << '_'
      result << build_str
    end
    build_str = '' if build_str.size.eql?(2)
  end
  result
end

p solution('abc') == ['ab', 'c_']
p solution('abcdef') == ['ab', 'cd', 'ef']
p solution("abcdef") == ["ab", "cd", "ef"]
p solution("abcdefg") == ["ab", "cd", "ef", "g_"]
p solution("") == []


# SECOND ATTEMPT 16:35

# def solution(str)
#   result = []
#   pair = ''

#   str.each_char.with_index do |char, idx|
#     if str.size.odd? && (str.size - 1).eql?(idx)
#       pair << char + '_'
#       result << pair
#     else
#       pair << char
#       result << pair if pair.size.eql?(2)
#       pair = '' if pair.size.eql?(2)
#     end
#   end
#   result
# end

# def solution(str)
#   result = []
#   pair = ''
#   str.each_char.with_index do |char, idx|
#     pair << char
#     result << pair if pair.size.eql?(2)
#     pair = '' if pair.size.eql?(2)
#   end
#   result << pair + '_'
#   result
# end

str = 'abcdef'

(0...str.size).step(3) do |char|
  p str[char]
end

irb(main):011:1* 'abc'.chars.each_slice(2).to_a.each do |sub_arr|
  irb(main):012:2*   if sub_arr.count < 2
  irb(main):013:2*     sub_arr << '-'
  irb(main):014:1*   end
  irb(main):015:0> end
