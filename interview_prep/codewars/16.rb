=begin
Question:
Stop gninnipS My sdroW! (8:32)
(https://www.codewars.com/kata/5264d2b162488dc400000001)
6 kyu
Write a method that takes in a string of one or more words but with all five or more letter words reversed (Just like the name of this Kata). Strings passed in will consist of only letters and spaces. Spaces will be included only when more than one word is present.

-----------------------
Rules:
  Explicit Requirements
  - Return new string with all words >= 5 in length reversed
  - There are only letters and spaces in the input text

  Implicit Requirements

-----------------------
Examples:
p spinWords("Hey fellow warriors") == "Hey wollef sroirraw"
p spinWords("This is a test") == "This is a test"
p spinWords("This is another test") == "This is rehtona test"
P spinWords('test') == 'test'

-----------------------
Modeling:
`input_str` => "Hey fellow warriors" == "Hey wollef sroirraw"

Convert to array of `words` => ['Hey', 'fellow', 'warriors']

Set `words` equal to return of:
Iterate to transform each word that is greater than or equal to 5, others stay as is
  Reverse 'fellow' > 'wollef' , 'warriors' > sroirraw'
  All other words will just be returned as is 'Hey'

  Join the array with space, returned implicitly

-----------------------

Data Structure:
I: String
W: Array of words from input String
O: New string with rquired words reversed

Algorithm:
< given a string `input_str` >
Initialize `words` to the input string split into an array of words

Set `words` equal the retun value of iterating and transforming elements:
  Each word that is greater than or equal to 5, reverse
  All other words will just be left as is

  Join the array with space, returned implicitly

-----------------------
Code:
=end

def spinWords(input_str)
  words = input_str.split
  words = words.map do |word|
    if word.length >= 5
      word.reverse
    else
      word
    end
  end.join(' ')
end

p spinWords("Hey fellow warriors") == "Hey wollef sroirraw"
p spinWords("This is a test") == "This is a test"
p spinWords("This is another test") == "This is rehtona test"
p spinWords('test') == 'test'
