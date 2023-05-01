=begin
Question:
Duplicate Encoder

The goal of this exercise is to convert a string to a new string where each
character in the new string is "(" if that character appears only once in the
original string, or ")" if that character appears more than once in the original
string. Ignore capitalization when determining if a character is a duplicate.

-----------------------
Rules:
  Explicit Requirements
  - Convert string to a new string based on the following
    - If character appears once, replace it with '('
    - If it appers multiple times, replace it with ')'
  - Ignore case (make all lowercase)

  Implicit Requirements
  - All characters, even spaces, are to be manipulated

I: String
O: New transformed string


-----------------------
Examples:
"din"      =>  "((("
"recede"   =>  "()()()"
"Success"  =>  ")())())"
"(( @"     =>  "))((" 

-----------------------
Modeling:
"Success"  =>  ")())())"
Create `result` string
Convert all to lowercase => 'success'

Create `hash` with all characters counted, character is key, num of appearances
  is value => {s => 3, u => 1, c => 2, e => 2}

Iterate through `chars`
  If char hash value > 1
    push ')' into `result`
  else
    push '(' into `result`

return result

-----------------------
Data Structure:
I: String
W: Hash to hold char and count
O: New transformed string

Algorithm:
< given a string `str` >
Downcase the string
-----------------------
Code:
=end

duplicate_encode('recede')
