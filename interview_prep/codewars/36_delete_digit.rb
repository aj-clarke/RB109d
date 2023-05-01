=begin
Question:
6 kyu
Time was 22:30, but had afternoon to think after was on the wrong track at 12:14 min mark

Given an integer, find the greatest number you can obtain by deleting exactly one digit of the given number.

-----------------------
Rules:
  Explicit Requirements
  - Find the greatest number that can be made from removing only 1 digit from the input integer

  Implicit Requirements

-----------------------
Examples:
152, the output should be 52;
1001, the output should be 101.

-----------------------
Modeling:
1001 == 101

`int` = 1001

['1','0','0','1']
[    '0','0','1']
['1',    '0','1']
['1','0',    '1']


Init `arr` equal to converting the integer to a string then an array of characters

`arr` => ['1','0','0','1']

Init sub_size equal to the size of `arr` minus 1 => 3

`substrings` init to an empty collection

Iterate `arr` from idx pos 0 to the end of the array |si|
  Init `substring` = ''
  Iterate `arr` from index pos 0 to the end of the array |ei|
    Push into `substring` `arr` at `ei` idx position IF `ei` is not equal to `si`
  Push `substring` into `substrings`

`substrings` => ['100','101','001']

Iterate `substrings` and transform in place (desctructively) each substring into an integer.

Return the maximium value

-----------------------
Scratch Pad:
create subarrays that are equal to the original size - 1?

-----------------------
Data Structure:
I: Integer
W: Converting integer into string > into characters array > substrings > integer array
O: Maximum value integer

Algorithm:
< given an integer `int` >

Init `arr` equal to convertingt the integer to a string then an array of characters

# Init sub_size equal to the size of `arr` minus 1

`substrings` init to an empty collection

Iterate `arr` from idx pos 0 to the end of the array |si|
  Init `substring` equal to an empty string
  Iterate `arr` from index pos 0 to the end of the array |ei|
    Push into `substring` `arr` at `ei` idx position IF `ei` is not equal to `si`
  Push `substring` into `substrings`

check `substrings`

Iterate `substrings` and transform in place (desctructively) each substring into an integer.

Return max value in `substrings` after transformation above
-----------------------
Code:
=end

#Could have used a single each iteration to build each side of the 'substring' instead of nested
#substring = arr[0...idx] + arr[idx+1...arr.size]

def delete_digit(int)
  arr = int.to_s.chars
  # sub_size = arr.size - 1

  substrings = []

  arr.each_with_index do |_,idx|
    # substring = ''
    substrings << (arr[0...idx] + arr[(idx + 1)..-1]).join.to_i
  end
  # (0...arr.size).each do |si|
  #   substring = ''
  #   (0...arr.size).each do |ei|
  #     substring << arr[ei] if ei != si
  #   end
  #   substrings << substring
  # end
  substrings.max
end



p delete_digit(152) #== 52
p delete_digit(1001) == 101
p delete_digit(10) == 1
