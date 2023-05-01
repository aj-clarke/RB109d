=begin
Question:
Counting Duplicates
FIRST PASS: 24:30 mins | SECOND PASS: 9 mins | THIRD PASS: 13 mins
(https://www.codewars.com/kata/54bf1c2cd5b56cc47f0007a1/train/ruby)
6 kyu
Count the number of Duplicates
Write a method that will return the count of distinct case-insensitive alphabetic characters and numeric digits that occur more than once in the input string. The input string can be assumed to contain only alphabets (both uppercase and lowercase) and numeric digits.
Example
"abcde" -> 0 # no characters repeats more than once
"aabbcde" -> 2 # 'a' and 'b'
"aabBcde" -> 2 # 'a' occurs twice and 'b' twice (`b` and `B`)
"indivisibility" -> 1 # 'i' occurs six times
"Indivisibilities" -> 2 # 'i' occurs seven times and 's' occurs twice
"aA11" -> 2 # 'a' and '1'
"ABBA" -> 2 # 'A' and 'B' each occur twice

-----------------------
Questions:

Problem (Rewrite if needed else skip):

Input: String
Output: Integer
Rules:
  Explicit Requirements
  - Count alphabetic characters and numeric digits in a String
  - When the count of any character or digit is more than 1 we will count that digit towards the final tally
    - This will give us a count of digits that are duplicates
  - Duplicates are case insensitive
  - Input string will only contain alphanumeric characters

  Implicit Requirements
  - A string with no duplicates (includes empty string) returns 0
-----------------------
Examples:
p duplicate_count("") == 0
p duplicate_count("abcde") == 0
p duplicate_count("abcdeaa") == 1
p duplicate_count("abcdeaB") == 2
p duplicate_count("Indivisibilities") == 2

-----------------------
Modeling:
"Indivisibilities"
In-place downcase the input string

hash to store in letter (key) and count (value)

Iterate through the characters of the input String
    Add unique alphanumeric characters to the hash with their values

{i => 7, n => 1, d => 1, v => 1, s => 2, b => 1, l => 1, t => 1, e => 1}
hash = selecting key/value if the value is greather than 1

Count of hash size

-----------------------
Scratch Pad:
hash to hold alpha characters and their count (key/value)

-----------------------
Data Structure:
I: String
W: Hash to store alphanumeric characters and their count (key/value)
O: Integer representing count of alphanumeric characters that repreat

Algorithm:
< given a string `str` >
Return 0 if str is empty

Downcase (destructive) the input string `str`

Iterate through `str` with a hash object
    Initialize the hash object to Hash.new equal to 0
  `hash[char]` equal to + 1 of whatever the current value is

Set `hash` equal to selecting key/value if the value is greather than 1

Count of hash elements as the return value


-----------------------
Code:
=end

def duplicate_count(str)
  # return 0 if str.empty?

  str = str.downcase

  str.each_char.with_object(hash = Hash.new(0)) do |char|
    hash[char] += 1
  end
  hash.select { |_, v| v > 1 }.size
end

p duplicate_count("") == 0
p duplicate_count("abcde") == 0
p duplicate_count("abcdeaa") == 1
p duplicate_count("abcdeaB") == 2
p duplicate_count("Indivisibilities") == 2
