=begin
Question:
6 kyu
Find the longest substring in alphabetical order.
Example: the longest alphabetical substring in "asdfaaaabbbbcttavvfffffdf" is "aaaabbbbctt".
There are tests with strings up to 10 000 characters long so your code will need to be efficient.
The input will only consist of lowercase characters and will be at least one letter long.
If there are multiple solutions, return the one that appears first.

-----------------------
Rules:
  Explicit Requirements
  - Find longest alphabetical ordered substring
  - Input only lowercase, and always at least one letter in length
  - Return the first longest substring that meets the criteria

  Implicit Requirements
  - If multiple letters are the same, treat as if its just one letter

-----------------------
Examples:
p longest('asd') == 'as'
p longest('nab') == 'ab'
p longest('abcdeapbcdef') == 'abcde'
p longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt'
p longest('asdfbyfgiklag') =='fgikl'
p longest('z') == 'z'
p longest('zyba') == 'z'

-----------------------
Modeling:
'asdfaaaabbbbcttavvfffffdf' == 'aaaabbbbctt'
'a', 'as', 'asd'...'aaaabbbbctt', 'df','f'
 0    0, 17  0, 17, 3

Create substrings (dual iteration, |outer| and |inner|)
  only push in substring if substring == substring.sort
Check substrings

Get max size from the array

Select subarrays that are equal to the max size

return the first element

-----------------------
Data Structure:
I: String
W: Array of substrings
O: Longest substring

Algorithm:
< given a string `str` >

Initilaze substrings to empty collection

Iterate through substring |outer| to get starting idx of each substring
  Iterate through substring |inner| to get ending ind of each substring
    Push substring into `substrings` if the substring equals sorting the substring in ascending order

Initliaze `max_string` to obtaining the max substring length

Iterate and only select substrings equal to the `max_string` size

Return the first element from `substrings`

-----------------------
Code:
=end

def longest(str)
  substrings = []

  (0...str.size).each do |outer|
    (outer...str.size).each do |inner|
      substrings << str[outer..inner] if str[outer..inner] == str[outer..inner].chars.sort.join
    end
  end

  # Nick
  # substrings.max_by do |string|
  #   string.size
  # end

  max_string = 0
  substrings.each do |string|
    max_string = string.size if string.size > max_string
  end
  substrings = substrings.select do |string|
    string.size == max_string
  end
  substrings[0]
end

# p longest('asd') == 'as'
# p longest('nab') == 'ab'
p longest('abcdeapbcdef') #== 'abcde'
# p longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt'
# p longest('asdfbyfgiklag') =='fgikl'
# p longest('z') == 'z'
# p longest('zyba') == 'z'
