=begin
Question:
Substring fun (12:27)
(https://www.codewars.com/kata/565b112d09c1adfdd500019c/train/ruby)
7 kyu
=begin
Complete the method that takes an array of words.
You must concatenate the nth letter from each word to construct a new word which should be returned as a string, where n is the position of the word in the list.
For example:
["yoda", "best", "has"] --> "yes"
  ^        ^        ^
n=0 n=1 n=2
Note: Test cases contain valid input only - i.e. a string array or an empty array; and each word will have enough letters.

-----------------------
Rules:
  Explicit Requirements
  - concatenate the `nth` letter from each word to construct a new word
  - Return new word as a String
  - 'n' is the index position of the word in the array

  Implicit Requirements

-----------------------
Examples:
nth_char(['yoda', 'best', 'has']) == 'yes'
nth_char([]) == ''
nth_char(['X-ray']) == 'X'
nth_char(['No', 'No']) == 'No'
nth_char(['Chad', 'Morocco', 'India', 'Algeria', 'Botswana', 'Bahamas', 'Ecuador', 'Micronesia']) == 'Codewars'

-----------------------
Modeling:
['yoda', 'best', 'has']) == 'yes'
  idx 0   idx 1   idx 2

  # idx of word is the same idx of the letter needed from that word

  # `result` is a empty String

  # Get a count of the array size - 1

  # Count up to that size (counter set to 0?)

  NEVERMIND, JUST MAP with index the current index position of the current word (word[idx]) and join the array
  
-----------------------

Data Structure:
I: Array of strings
W: Mapping the array to transform elements into the character from the words index position
O: String

Algorithm:
< given an array `arr` >

Transform each element (word) from the input `arr` via its index position reference
  Each element with index is passed in. Use the index to obtain a character from the current word/element. This will result in the arrays elements to be transformed
Join the array elements
-----------------------
Code:
=end

def nth_char(arr)
  arr.map.with_index { |word, idx| word[idx] }.join
end

p nth_char(['yoda', 'best', 'has']) == 'yes'
p nth_char([]) == ''
p nth_char(['X-ray']) == 'X'
p nth_char(['No', 'No']) == 'No'
p nth_char(['Chad', 'Morocco', 'India', 'Algeria', 'Botswana', 'Bahamas', 'Ecuador', 'Micronesia']) == 'Codewars'
