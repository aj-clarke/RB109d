=begin
Question:
Count letters in string 
FIRST PASS: 17:10 | SECOND PASS: 9:10 | THIRD PASS: 7:58
In this kata, you have to count lowercase letters in a given string and return the letter count in a hash with 'letter' as key and count as 'value'. The key must be a 'symbol' instead of a string.
-----------------------
Rules:
  Explicit Requirements
  - Cout lowercase letters in the given String
  - Return letter coutn in a Hash
  - The letter should be the key in the form of a Symbol
  - The count of the letter should be the value

  Implicit Requirements
  - Sort the letters of the input string prior to creating hash

I: String
O: Hash with the letter (Symbol as key), and count (value) of that letter in the sting


-----------------------
Examples:
p letter_count('codewars') == { :a=>1, :c=>1, :d=>1, :e=>1, :o=>1, :r=>1, :s=>1, :w=>1 }
p letter_count('activity') == { :a=>1, :c=>1, :i=>2, :t=>2, :v=>1, :y=>1 }
p letter_count('arithmetics') == { :a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2 }

-----------------------
Modeling:
'activity' == { :a=>1, :c=>1, :i=>2, :t=>2, :v=>1, :y=>1 }

Sort String =='aciittvy'

First way, is tally (cheat code)

Second way:

String to element of characters (chars) => ['a','c','i','i','t','t','v','y']

Each with object iteration (new hash equal to 0 as object) |char, hash|
  hash[char.to_s] increment by 1

return the hash

-----------------------

Data Structure:
I: String
W: Array of chars > hash
O: Hash

Algorithm:
< given a string `str` >

Sort! the string:
  Initialize `chars` to converting the string into an array of characters, then sorting

Iterate through `chars` with an object (init hash here) |char, hash|
  Increment the current hash[`char`] (when converted to a symbol) value by 1

Return the hash
-----------------------
Code:
=end

# def letter_count(str)
#   chars = str.chars.sort # sort is not necessary, but does match test cases output
#   chars.each_with_object(Hash.new(0)) do |char, hash|
#     hash[char.to_sym] += 1
#   end
# end

# Using TALLY method, then transforming each with map (converts to an array),
# then convert return value back to hash
# def letter_count(str)
#   p str = str.chars.tally#.map { |k, v| [k.to_sym, v] }.to_h
# end

def letter_count(str)
  str.each_char.with_object(Hash.new(0)) do |char, hash|
    hash[char.to_sym] += 1
  end
end

p letter_count('codewars') == { :a=>1, :c=>1, :d=>1, :e=>1, :o=>1, :r=>1, :s=>1, :w=>1 }
p letter_count('activity') == { :a=>1, :c=>1, :i=>2, :t=>2, :v=>1, :y=>1 }
p letter_count('arithmetics') == { :a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2 }

