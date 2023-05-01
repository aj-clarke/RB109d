=begin
Question:
Find the missing letter (27:50)
(https://www.codewars.com/kata/5839edaa6754d6fec10000a2)
6 kyu
#Find the missing letter
Write a method that takes an array of consecutive (increasing) letters as input and that returns the missing letter in the array.
You will always get an valid array. And it will be always exactly one letter be missing. The length of the array will alwaysbe at least 2.
The array will always contain letters in only one case.

-----------------------

Rules:
  Explicit Requirements
  - Return the missing letter from the input Array
  - There will always be only one missing letter
  - There will always a valid Array
  - The array length will always be at least 2
  - The array will always contain letters in only one case (return the right case)

  Implicit Requirements

-----------------------
Examples:
['a','b','c','d','f'] -> 'e'
['O','Q','R','S'] -> 'P'

-----------------------
Modeling:
['a','b','c','d','f'] -> 'e'

Find the case
If the first letter of the array is equal to upcasing the array
  Set a `alpha_case` to 'upcase'
  ELSE
  Set `alpha_case` to 'downcase'

`letter` is '' empty string
`found_letter` is '' empty string

Iterate the array (arr) |char|
  first iteration will be the character => 'a'
  if `letter` empty, then set it to the "next" `char` => `letter` = 'b'
  else
    if `char` is equal to `letter`
      set `letter` to "next" `char`

    ELSE
      set `found_letter` to `char`
      break out of iteration
      
  
Ternary to set case of `found_letter` based off of `alpha_case`


-----------------------
Scratch Pad:


-----------------------
Data Structure:
I:
W:
O:

Algorithm:
< given an array `arr` >
Find the case
If the first letter of the array is equal to upcasing the array
  Set a `alpha_case` to 'upcase'
  ELSE
  Set `alpha_case` to 'downcase'

Initialize `letter` to an empty string
Initialize `found_letter` to an empty string

Iterate the input array `arr` |char|
  if `letter` is an empty string, then set it to the "next" character
  else
    if `char` is equal to `letter`
      set `letter` to the "next" character

    ELSE
      set `letter` to `char`
      Ternary to set case of `letter` based off of `alpha_case`
      return `letter`
      
  

-----------------------
Code:
=end

def find_missing_letter(arr)
  if arr[0].upcase.eql?(arr[0])
    alpha_case = 'upcase'
  # else
  #   alpha_case = 'downcase'
  end
  letter = ''
  found_letter = ''

  arr.each do |char|
    if letter.eql?('')
      letter = char.next
    else
      if char.eql?(letter)
        letter = char.next
      else
        alpha_case.eql?('upcase') ? letter = letter.upcase : letter
        return letter
      end
    end
  end
end


p find_missing_letter(["a","b","c","d","f"]) == "e"
p find_missing_letter(["O","Q","R","S"]) == "P"

# could have created an array (arr.first..arr.last) and subtracted one from
# the other to see what letter was left then returned it