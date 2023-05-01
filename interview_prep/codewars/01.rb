=begin
(https://www.codewars.com/kata/5808ff71c7cfa1c6aa00006d/train/ruby)
6 kyu
Question:

Count letters in string
In this kata, you have to count lowercase letters in a given string and return the letter count in a hash with the 'letter' as the key and count as the 'value'. The key must be a 'symbol' instead of a string in Ruby.
Example:
letter_count('arithmetics') #=> {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}

-----------------------
Questions:

Problem (Rewrite if needed else skip):

Input: A string
Output: Hash with `letter` as they key (convert to a sym) and count as value
Rules:
  Explicit Requirements
  - Letter and count of letters made into a hash key/value pair
  - Unique letters converted to Symbol as key with count as value

  Implicit Requirements
  - Not concerned with empty strings or spaces

-----------------------
Modeling:
'arithmetics' #=> {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}


-----------------------
Examples:


-----------------------
Scratch Pad:
convert the letter to a symbol

-----------------------
Data Structure:
Algorithm:
- Define `letter_count` with param `str`
- Iterate through the string to account for each character to populate the hash
- Each character `char`, convert to a symbol and add to hash if it is uniqe.
  - If not unique add `1` to the value.

-----------------------
Code:
=end

def letter_count(str)
  str.each_char.with_object({}) do |char, hash|
    if hash[char.to_sym]
      hash[char.to_sym] += 1
    else
      hash[char.to_sym] = 1
    end
  end
end

# Refactor
def letter_count(str)
  str.each_char.with_object(Hash.new(0)) do |char, hash|
    hash[char.to_sym] += 1
  end
end

p letter_count('codewars') == {:a=>1, :c=>1, :d=>1, :e=>1, :o=>1, :r=>1, :s=>1, :w=>1}
p letter_count('activity') == {:a=>1, :c=>1, :i=>2, :t=>2, :v=>1, :y=>1}
p letter_count('arithmetics') == {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}