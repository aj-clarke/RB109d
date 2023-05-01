=begin
Question:
Largest product in a series
FIRST PASS: 28:30 mins  SECOND PASS: 35 mins  THIRD PASS: 23 mins  FOURTH PASS: 20:45
FIFTH PASS: 15:40 mins
(https://www.codewars.com/kata/529872bdd0f550a06b00026e/train/ruby)
6 kyu
Complete the greatest Product method so that it will find the greatest product of five consecutive digits in the given string of digits.
For example:
greatestProduct("123834539327238239583") // should return 3240
The input string always has more than five digits.

-----------------------
Questions:

Problem (Rewrite if needed else skip):

Input: String of characters representing integers
Output: Integer
Rules:
  Explicit Requirements
    - Find greatest product of 5 consecutive digits from the input String
    - Will always be a string longer than 5 characters/digits

  Implicit Requirements

-----------------------
Modeling:
("123834539327238239583") will equal 3240
Convert string to an array (chars)
[1, 2, 3, 8, 3, 4, 5, 3, 9, 3, 2, 7, 2, 3, 8, 2, 3, 9, 5, 8, 3]
[[1, 2, 3, 8, 3], [2, 3, 8, 3, 4]]
empty collection for subarrays
Iterate through the array |outer|
  Iterate through the array |inner|
    collection << array[outer..inner] if the size of that array is 5

transform each subarray to the product of all its elements
return the max value

-----------------------
Examples:
p greatest_product("123834539327238239583") == 3240
p greatest_product("395831238345393272382") == 3240
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("02494037820244202221011110532909999") == 0

-----------------------
Scratch Pad:


-----------------------
Data Structure:
I: String of digits
W:
- Array (string converted to array)
- Array for subarrays and to obtain max product results
O: Integer representing the greatest product of 5 consecutive digits

Algorithm:
< given a string `str` >

Convert the string to an array of integers (call it `arr`)

Initialize `subarrays` to an empty collection []

Iterate through `arr` |outer| => Beginning index for each subarray
  Iterate through `arr` |inner| => Ending index for each subarray
    Push into `subarrays` the result of `arr[outer..inner]` if the array size is equal to 5

Transform the `subarrays`` to the product of their elements, then find the max value of all sub arrays
Return this value (implicit)
-----------------------
Code:
=end

def greatest_product(str)
  arr = str.chars
  arr.map! { |char| char.to_i }

  subarrays = []

  (0..arr.size).to_a.each do |outer|
    (outer..arr.size).to_a.each do |inner|
      subarrays << arr[outer..inner] if arr[outer..inner].size.eql?(5)
    end
  end
  subarrays.map! { |subarray| subarray.reduce(:*) }.max
end

p greatest_product("123834539327238239583") == 3240
p greatest_product("395831238345393272382") == 3240
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("02494037820244202221011110532909999") == 0



# THIRD PASS SOLUTION (WITH HELPER METHODS REFACTORED IN)

=begin

Rules:
  Explicit Requirements
  - Find greatest product of 5 consecutive integers in the given string
  - Input string will always have more than 5 digits

  Implicit Requirements

-----------------------
Examples:
p greatest_product("123834539327238239583") == 3240
p greatest_product("395831238345393272382") == 3240
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("02494037820244202221011110532909999") == 0

-----------------------
Modeling:
"02494037820244202221011110532909999") == 0

`substrings` arr init
Get all substrings equal to 5 in length
['02494', '24940', '49403'...'09999']

Nested iterate through input string:
  (0...str.size) |start_idx|
    (start_idx...str.size) |end_idx| => First pass is '02494'
      Push into substrings the result of slicing the input string from [start_idx..end_idx]

substrings => ['02494', '24940', '49403'...'09999']
CHECK SUBSTRINGS

Iterate substrings to transform each substring |substring|
  substring = convert to array of 'chars' (enumerable returned) ['0','2','4','9','4'], chain map! to convert each to_i, then reduce via the product

CHECK SUBSTRINGS

Sort the substrings > return the last element

-----------------------

Data Structure:
I: String
W: Array of substrings
O: Highest product of 5 consecutive integers

Algorithm:
< given a string `str` >
Init `substrings` to empty collection

Nested iterate through input string:
  Iterate through `substrings` |start_idx|
    Iterate through `substrings` again |end_idx|
      Push into `substrings` the result of slicing the input string from `start_idx` to `end_idx`

CHECK SUBSTRINGS for accuracy

Set `substrings` equal to iterating to transform each substring |substring|
  - Set `substring` equal to converting to array of 'chars' (enumerable returned) ['0','2','4','9','4']
  - Chain on to transform array of elements to conver each to an integer
  - Chain on to then multiply each array element together for a totoal product

Check SUBSTRINGS

Sort the `substrings` array and return the last element (should be the largest)
-----------------------
Code:
=end

def greatest_product(str)
  substrings = get_substrings(str)
  # (0...str.size).each do |start_idx|
  #   (start_idx...str.size).each do |end_idx|
  #     substrings << str[start_idx..end_idx] if str[start_idx..end_idx].size.eql?(5)
  #   end
  # end
  substrings = get_substrings_product(substrings)
  # substrings = substrings.map do |substring|
  #   substring = substring.chars.map(&:to_i).reduce(:*)
  # end
  substrings.sort.last
end

def get_substrings(str)
  substrings = []
  (0...str.size).each do |start_idx|
    (start_idx...str.size).each do |end_idx|
      substrings << str[start_idx..end_idx] if str[start_idx..end_idx].size.eql?(5)
    end
  end
  substrings
end

def get_substrings_product(substrings)
  substrings = substrings.map do |substring|
    substring = substring.chars.map(&:to_i).reduce(:*)
  end
end

p greatest_product("123834539327238239583") == 3240
p greatest_product("395831238345393272382") == 3240
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("02494037820244202221011110532909999") == 0


=begin
FOURTH PASS

Rules:
  Explicit Requirements
  - Find greatest product of five consecutive digits from input String
  - String will always have more than 5 digits

  Implicit Requirements

-----------------------
Examples:
p greatest_product("123834539327238239583") == 3240
p greatest_product("395831238345393272382") == 3240
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("02494037820244202221011110532909999") == 0

-----------------------
Modeling:
"123834539327238239583" == 3240

`result` empty collection

Iterate through the string from index 0 to end of string |start_idx|
  Iterate through string from `start_idx` to end of string |end_idx|
    Push into `substrings` current string (start_idx to end_idx) converted to an integer if it is 5 characters in size

CHECK RESULT ARRAY

Iterate `result` to transform each 5 element subarray into a product of those 5 elements for each subarray

Then sort the array, and return the last element

-----------------------

Data Structure:
I: Integer
W: Array of subarrays
O: Sum of the above Array

Algorithm:
< given a string `str` >

Init `result` to an empty collection

Iterate through the string from index 0 to end of string |start_idx|
  Iterate through string from `start_idx` to end of string |end_idx|
    Push into `substrings` current string `str`(start_idx to end_idx) if it is 5 characters in size

CHECK RESULT ARRAY

Iterate `result` to convert each string into an array of string chars converted to integers

Iterate `result` to transform each 5 element subarray into a product of those 5 elements for each subarray

Then sort the array, and return the last element

-----------------------
Code:
=end

def greatest_product(str)
  result = []

  (0...str.size).each do |start_idx|
    (start_idx...str.size).each do |end_idx|
      result << str[start_idx..end_idx] if str[start_idx..end_idx].size.eql?(5)
    end
  end
  result.map! do |substring|
    substring.chars.map!(&:to_i).reduce(:*)
  end
  result.sort.last
end

p greatest_product("123834539327238239583") == 3240
p greatest_product("395831238345393272382") == 3240
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("02494037820244202221011110532909999") == 0