=begin
Question:
Least common character
FIRST: 27:10 | SECOND: 20:27 | THIRD: 13:35 | FOURTH: 16:45 | FIFTH: 12:50

# Write a method that takes a string as an argument and returns
# the character that occurs least often in the given string.
# If there are multiple characters with the equal lowest number
# of occurrences, then return the one that appears first in the
# string. When counting characters, consider the uppercase and
# lowercase version to be the same.

-----------------------
Rules:
  Explicit Requirements
  - Return least occuring character from the input string
  - If multiple characters have the lowest count, return the first that appeared
  - Case does not matter, m and M count as 2 m's

  Implicit Requirements
  - Spaces count as well
I: String
O: Character that occurs the least amount of tiems in the input string


-----------------------
Examples:
p least_common_char("Hello World") #== "h"
p least_common_char("Peter Piper picked a peck of pickled peppers") #== "t"
p least_common_char("Mississippi") #== "m"
p least_common_char("Happy birthday!") #== ' '
p least_common_char("aaaaaAAAA") #== 'a'

-----------------------
Modeling:
("Hello World") #== "h"

'h' => 1 => already wins, only has 1 and is the first char in the word
'e' => 1
'l' => 3
......

downcase the String => 'hello world'

`count` for the number of times a letter shows up = `nil`
'letter' to store the letter with the lowest count

`str_arr` = convert to array of characters (chars)
['h', 'e', 'l', 'l', 'o', ' ', 'w', 'o', 'r', 'l', 'd'] 

`str_arr_uniq` = unique characters in `str_arr``
iterate through `str_arr_uniq` characters |uniq_char| => ['h', 'e', 'l', 'o', ' ', 'w', 'r', 'd']
  if `count` nil
  (first pass) set count equal to the number of times the first |uniq_char| shows up
  (first pass) set letter = `uniq_char`
  else
  `temp_count` = getting a count of the uniq_char in `str_arr`
    if temp_count < count
      count = temp_count
      letter equals `uniq_char`

return `letter`

-----------------------
Data Structure:
I: String
W: Array of string characters to obtain counts
O: Character (string) that first occurs the least

Algorithm:
< given a string 'input_str' >
  downcase `input_str`

  Intialize `count` to nil
  Intialize `letter` to nil

  Initialize `str_arr` to an array of the string characters

  Initialize `str_arr_uniq` to the unique characters in `str_arr`

  Iterate through `str_arr_uniq` characters |uniq_char|
    For the first iteration (using a conditional) if `count` is nil
      Set count equal to the number of times the first |uniq_char| shows up
      Set letter = `uniq_char`
    else
      Initialize `temp_count` equal to getting a count of the `uniq_char` in `str_arr`
        str_arr(uniq_char) count
        If `temp_count` < `count`
          Set `count` to `temp_count`
          Set `letter` to `uniq_char`

Return `letter`

-----------------------
Code:
=end

def least_common_char(input_str)
  input_str = input_str.downcase

  count = nil
  letter = nil
  str_arr = input_str.chars
  str_arr_uniq = str_arr.uniq

  str_arr_uniq.each do |uniq_char|
    if count.nil?
      count = str_arr.count(uniq_char)
      letter = uniq_char
    else
      temp_count = str_arr.count(uniq_char)
      if temp_count < count
        count = temp_count
        letter = uniq_char
      end
    end
  end
  letter
end

p least_common_char("Hello World") == "h"
p least_common_char("Peter Piper picked a peck of pickled peppers") == "t"
p least_common_char("Mississippi") == "m"
p least_common_char("Happy birthday!") == ' '
p least_common_char("aaaaaAAAA") == 'a'


=begin
SECOND ATTEMPT (MUCH CLEANER)

Rules:
  Explicit Requirements
  - REturn character that occurs least often in input String
  - If multiple have least occurences, return the first that appears in the String
  - When counting, chars are case insenstitive 

  Implicit Requirements
  - Looks like method checks with all chars downcased

-----------------------
Examples:
p least_common_char("Hello World") #== "h"
p least_common_char("Peter Piper picked a peck of pickled peppers") #== "t"
p least_common_char("Mississippi") #== "m"
p least_common_char("Happy birthday!") #== ' '
p least_common_char("aaaaaAAAA") #== 'a'

-----------------------
Modeling:
"Hello World" #== "h"
`arr` = Split string into DOWNCASED chars = ['h','e','l','l','o',' ','w','o','r','l','d']

`result` = Iterate with hash object to get a hash count of each char

{ 'h' => 1, 'e' => 1', 'l' = > 2....'d' => 1 }

Return the first minimum values key from `result` hash (min_by the value, then reference first element)

-----------------------
Data Structure:
I: String
W: Array of characters. Hash of char/counts
O: First char with the lowest count in the string

Algorithm:
< given a string `str` >

Init `arr` to downcased array of characters (from input `str`)

Init `result` to iterating `arr` with a hash object to get a count of each char |char, hash|
  For each key `char` add 1 to that keys value

Iterate `result` to find the minimum value by the `hash` keys values (will obtain an 2 element array with the key/value pair)
  Return the first element

-----------------------
Code:
=end

# def least_common_char(str)
#   hash = str.downcase.chars.tally
#   lowest_val = hash.values.min

#   hash = hash.select { |_,v| v.eql?(lowest_val)}.keys.first
# end

def least_common_char(str)
  hash = str.downcase.chars.tally
  hash.min_by { |_,count| count}.first

  # hash = hash.select { |_,v| v.eql?(lowest_val)}.keys.first
end

def least_common_char(str)
  arr = str.downcase.chars
  result = arr.each_with_object(Hash.new(0)) do |char, hash|
    hash[char] += 1
  end
  result.min_by { |_, count| count }[0]
end



def least_common_char(str)
  str.downcase.chars.tally.min_by { |_,v| v }.first
end

p least_common_char("Hello World") == "h"
p least_common_char("Peter Piper picked a peck of pickled peppers") == "t"
p least_common_char("Mississippi") == "m"
p least_common_char("Happy birthday!") == ' '
p least_common_char("aaaaaAAAA") == 'a'