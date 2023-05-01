=begin
Question:
Unique in Order
FIRST: 15:45

Create a method `unique_in_order` which takes a string as argument and returns a list of items without any elements with the same value next to each other while preserving the original order of elements.
Don't use #squeeze
-----------------------
Questions:

Rules:
  Explicit Requirements
  - Return an array of elements (created from the string) where all elements that repeat beside one another are squeezed down to the one unique letter/number

  Implicit Requirements

-----------------------
Examples:
unique_in_order('AAAABBBCCDAABBB') == ['A','B','C','D','A','B']
unique_in_order('ABBCcAD')         == ['A', 'B', 'C', 'c', 'A', 'D']
unique_in_order([1,2,2,3,3])       == [1,2,3]

-----------------------
Modeling:
'AAAABBBCCDAABBB' == ['A','B','C','D','A','B']

`str` => 'AAAABBBCCDAABBB'

IF `str` is a String, Init `arr` to converting string to an array of characters
IF NOT
Init `arr` equal to str

Init `result` to an empty collection
Push in `arr` 0 idx element

Iterate `arr` from idx 1 to the end of the array |idx|
  Push into `result` `arr` and index pos `idx` if `result` at `idx - 1` does not equal `arr` at index pos `idx`

Return `result`
-----------------------
Data Structure:
I: String or Array
W: Populating new Array as needed
O: Array of Unique in order elements

Algorithm:
< given an argument `str` >

IF `str` is a String, Init `arr` to converting string to an array of characters
IF NOT
Init `arr` equal to str

Init `result` to an empty collection
Push in `arr` 0 idx element

Iterate `arr` from idx 1 to the end of the array |idx|
  Push into `result` `arr` and index pos `idx` if `arr` at `idx - 1` does not equal `arr` at index pos `idx`

Return `result`
-----------------------
Code:
=end

def unique_in_order(str)
  if str.is_a?(String)
    arr = str.chars
  else
    arr = str
  end

  result = []
  result << arr[0]

  (1...arr.size).each do |idx|
    result << arr[idx] if arr[idx - 1] != arr[idx]
  end
  result
end

p unique_in_order('AAAABBBCCDAABBB') == ['A','B','C','D','A','B']
p unique_in_order('ABBCcAD')         == ['A', 'B', 'C', 'c', 'A', 'D']
p unique_in_order([1,2,2,3,3])       == [1,2,3]
