=begin
Question:
WeIrD StRiNg CaSe
FIRST PASS: 45+ mins   SECOND PASS: 21:38  THIRD PASS: 14:55!!!!!

Write a method weirdcase that accepts a string, and returns the same string with all even indexed characters in each word upper cased, and all odd indexed characters in each word lower cased. The indexing just explained is zero based, so the zero-ith index is even, therefore that character should be upper cased and you need to start over for each word.

The passed in string will only consist of alphabetical characters and spaces(' '). Spaces will only be present if there are multiple words. Words will be separated by a single space(' ').


-----------------------
Rules:
  Explicit Requirements
  - Method should return string with all even indexed chars in each word uppercased
  - Uppercasing starts over for each word, not based on entire strings (if multiple words) index positions
  - INput string will only contain alpha chars and spaces
  - Spaces only present if multiple words, and words will be seperated by only 1 space

  Implicit Requirements

I:
O:
W:

-----------------------
Examples:
weirdcase( "String" ) == "StRiNg"
weirdcase( "Weird string case" ) == "WeIrD StRiNg CaSe"
weirdcase('This') == 'ThIs'
weirdcase('is') == 'Is'
weirdcase('This is a test') == 'ThIs Is A TeSt'

-----------------------
Modeling:
"Weird string case" => input
"WeIrD StRiNg CaSe" => expected output

change entire string to lowercase => "weird string case"

break up each word via splitting them
['weird', 'string', 'case']

Iterate over the words to transform them all (map!) => 'weird'    'string'    'case'
  Iterate over each words characters => 'w', 'e', 'i', 'r', 'd'
    If the range integer is even, upcase the letter

['WeIrD', 'StRiNg', 'CaSe']

Join the words back together via a space => "WeIrD StRiNg CaSe"

-----------------------
Data Structure:
I: String
W: Array of words and characters
O: New Transformed String

Algorithm:
< given a string `str` >
Return and empty string, if input string is empty
Set `str` equal to str downcased (destructivly)

Initialize `words` to splitting the string up into individual words

Iterate over the words to transform them all (map!) => 'weird'    'string'    'case'
  Initilaze `counter` for even/odd tracking to 0
  Iterate over each words characters  => 'w', 'e', 'i', 'r', 'd' 
    If the `counter` integer is even, upcase the letter
    Add 1 to the `counter`

Join the `words` array with a space
-----------------------
Code:
=end

def weirdcase(str)
  return "" if str.empty?

  str.downcase!

  words = str.split
  words = words.map do |word|
    word = word.chars.each_with_index do |char,idx|
    # or |  word = word.each_char.map.with_index do |char, idx|
      if idx.even?
        char.upcase!
      else
        char
      end
    end
    word.join
  end
  words.join(' ')
end

p weirdcase( "String" ) == "StRiNg"
p weirdcase( "Weird string case" ) == "WeIrD StRiNg CaSe"
p weirdcase('This') == 'ThIs'
p weirdcase('is') == 'Is'
p weirdcase('This is a test') == 'ThIs Is A TeSt'


# SECOND PASS --------------------------------

=beginRules:
  Explicit Requirements
  - Return string with all even indexed chars for EACH WORD upcased, and all even indexed chars for EACH WORD lower cased
    (EACH WORD STARTS INDEX COUNT OVER)
  - Input str will only consist of alpha chars and single spaces, spaces will only be there for multiple words

  Implicit Requirements

-----------------------
Examples:
p weirdcase( "String" ) == "StRiNg"
p weirdcase( "Weird string case" ) == "WeIrD StRiNg CaSe"

-----------------------
Modeling:
"Weird string case" == "WeIrD StRiNg CaSe"

Downcase the entire string just in case => "weird string case"

Split up words into an array of `words`

Iterate through the words array |word|
  Set `word` equal to:
  - Convertion to array of `chars` (break into an array of individual chararacters)
  - Iterate `word` to transform each even index to upcase (will need index with iteration)Iterate through (destructive map!), and leave the others as is
  Set `word` = to join the word array back together

-----------------------
Data Structure:
I: String
W: Array of words and characters
O: New modified string

Algorithm:
< given a string `str` >

Set `words` equal to downcasing then splitting input string into individual words

Iterate through `words` array |word|
    Set `word` equal to:
  - Convertion to array of `chars` (break into an array of individual chararacters)
  - Iterate `word` to transform each (IF it is an even index) to upcase (will need index with iteration) Iterate through destructively, and (ELSE) leave the others as is
  Set `word` = to join the word array back together

Return new string

-----------------------
Code:
=end

def weirdcase(str)
  words = str.downcase.split
  
  words = words.map do |word|
    word = word.chars
    word.map!.with_index do |char, idx|
      if idx.even?
        char.upcase
      else
        char
      end
    end
    word.join
  end
  words.join(' ')
end

p weirdcase( "String" ) == "StRiNg"
p weirdcase( "Weird string case" ) == "WeIrD StRiNg CaSe"

=begin
THIRD PASS

Rules:
  Explicit Requirements
  - Return the string with all even indexed chars in each word upcased, and all odd downcased
  - Each word begins a new index counting (so the first letter will alwasy be upcased)
  - Only alpha cars and spaces in each string, and only a single space if there are multiple words

  Implicit Requirements

-----------------------

Modeling:
"Weird string case"  == "WeIrD StRiNg CaSe"
`str` = `str` downcased

`words` = Separate each word by spaces
['weird', 'string', 'case']

Iterate and transform each word in place
  'weird'
  'string'
  'case'
  Iterate chars and transform with index
    ['w','e','i','r','d']
    Upcase even index
    Just return odd index
    ['W','e','I','r','D']
  Iteration ends, then Join this word => ['WeIrD']
Iteration ends, then join words via space

-----------------------

Data Structure:
I: String
W: Arrays for words and for characters in words to transform as needed
O: String with chars modified as required

Algorithm:
< given a string `str` >

Reassign `str` to `str` downcased

Init `words` to splitting string at spaces

Iterate `words` and transform each word in place |word|
  Iterate `word` and transform with index |char|
    If index is even, upcase the `char`
    If index is odd, just return the `char`
  Join the `word` array back together
Join the `words` array back together with a space

-----------------------
Code:
=end

def weirdcase(str)
  str = str.downcase
  words = str.split

  words.map! do |word|
    word.chars.map.with_index do |char, idx|
      if idx.even?
        char.upcase!
      else
        char
      end
    end.join
  end.join(' ')
end

p weirdcase( "String" ) == "StRiNg"
p weirdcase( "Weird string case" ) == "WeIrD StRiNg CaSe"