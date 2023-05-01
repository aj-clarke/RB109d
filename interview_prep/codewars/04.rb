=begin
Question:
Alphabet symmetry (27:30)
(https://www.codewars.com/kata/59d9ff9f7905dfeed50000b0)
7 kyu
Consider the word "abode". We can see that the letter a is in position 1 and b is in position 2. In the alphabet, a and b are also in positions 1 and 2. Notice also that d and e in abode occupy the positions they would occupy in the alphabet, which are positions 4 and 5.
Given an array of words, return an array of the number of letters that occupy their positions in the alphabet for each word. For example:
solve(["abode","ABc","xyzD"]) = [4, 3, 1]

Input will consist of alphabet characters, both uppercase and lowercase. No spaces.

-----------------------
Rules:
  Explicit Requirements
  - Return an array providing a count of how many letters in each string occupy their positions in the alphabet 'a' = position 1, 'b' = position 2


  Implicit Requirements

-----------------------
Examples:
["abode","ABc","xyzD"]) == [4,3,1]
["abide","ABc","xyz"]) == [4,3,0]
["IAMDEFANDJKL","thedefgh","xyzDEFghijabc"])== [6,5,7]
["encode","abc","xyzD","ABmD"]) == [1, 3, 1, 3]

-----------------------
Modeling:
["abide","ABc","xyz"]) == [4,3,0]
[ 12_45 - 123 - ___ ] => [4, 3, 0]

alphabet = [!]
alphabet << ('a'..'z').to_a
flatten!

result array []

iterating input array |word| 'abide', 'abc', 'xyz'
  create a counter set to 0
  iterating words with index |char,idx| 'a' (0) 'b' 'i' 'd' 'e'
    If alphabet[idx + 1] ('a') is equal to `char` ('a')
      increase counter by 1
  push counter into `result`

  retur result
-----------------------

Data Structure:
I: Array of strings
W: Array of alphabet to compare against characters in string
O: Array of integers representing how many of the string characters are in the right position of the alphabet

Algorithm:
< given an array `arr` >

Initialize `alphabet` to an array with a ['!']
Push into `alphabet` an 'a' to 'z' string converted into an Array
Flatten the array permanently

Initialize `result` array to empty collection

Iterate through `arr` |word|
  Initialize `counter` equal to 0
    Iterate each word with index |char, idx|
      If alphabet at (`idx` + 1) position is equal to the current `char`
        Increase the counter by 1
  Push counter into the result Array

Return result

-----------------------
Code:
=end

def solve(arr)
  alphabet = ['!']
  alphabet << ('a'..'z').to_a
  alphabet.flatten!

  result = []
  arr.each do |word|
    counter = 0
    word.each_char.with_index do |char, idx|
      if alphabet[idx + 1].eql?(char.downcase)
        counter += 1
      end
    end
    result << counter
  end
  result
end

p solve(["abode","ABc","xyzD"]) == [4,3,1]
p solve(["abide","ABc","xyz"]) == [4,3,0]
p solve(["IAMDEFANDJKL","thedefgh","xyzDEFghijabc"])== [6,5,7]
p solve(["encode","abc","xyzD","ABmD"]) == [1, 3, 1, 3]
