=begin
Question:
Grouping and Counting 

FRIST PASS: 15 mins | SECOND PASS: 6:20

Your goal is to write the group_and_count method, which should receive an array as a unique parameter and return a hash. Empty or nil input must return nil instead of a hash. This hash returned must contain as keys the unique values of the array, and as values the counting of each value.

Example usage:

input = [1,1,2,2,2,3]

group_and_count(input)# == {1=>2, 2=>3, 3=>1}
The following methods were disabled:

Array#count
Array#length

-----------------------
Rules:
  Explicit Requirements
  - Method takes an array and returns a Hash
  - Empty array or `nil` input as the array parameter should return `nil`; not a empty Hash
  - Hash keys should be the unique integers from the array, and the values should be the count of the unique integers
  - Array#count and Array#length not allowed

  Implicit Requirements

I: Array of integers
O: Hash


-----------------------
Examples:
group_and_count([0,1,1,0]), {0=>2, 1=>2}

-----------------------
Modeling:
[0,1,1,0] => input
{0=>2, 1=>2} => output
If the input array is an empty array, or if `nil` is passed in, return `nil`
Initialize an empty `hash` collection

Iterate through the input Array
  If the current `integer` is a key in `hash` then add one to the value
  If not add it as a new key/value with 1 as the value

{0=>2, 1=>2}

Return that `hash`

-----------------------
Scratch Pad:


-----------------------
Data Structure:
I: Array of integers
W: Hash to create key/value pairs from unique array input integers
O: Hash representing they unique integers in the input array, and their count

Algorithm:
< given an array `arr` >
Return `nil` if it is an empty array or if `nil` is passed in

Initialize an empty `hash` collection

Iterate through the input Array
  If the current `integer` is a key in `hash` then add one to the value
  If not add it as a new `hash` key/value with 1 as the value

Return `hash`

-----------------------
Code:
=end

def group_and_count(arr)
  return nil if arr.nil? || arr.empty?

  hash = {}

  arr.each do |int|
    if hash[int]
      hash[int] += 1
    else
      hash[int] = 1
    end
  end
  hash
end

p group_and_count([0,1,1,0]) == {0=>2, 1=>2}
p group_and_count(nil) == nil
p group_and_count([]) == nil


=begin
SECOND ATTEMPT

Rules:
  Explicit Requirements
  - Take in an array and return a hash
  - Hash will contain unique values as keys, and their count as values
  - CANNOT USE Array#count or Array#length or Array#size

  Implicit Requirements

-----------------------
Examples:
input = [1,1,2,2,2,3]

group_and_count(input)# == {1=>2, 2=>3, 3=>1}

-----------------------
Modeling:
CANNOT USE Array#count or Array#length or Array#size
NIL input or Empty input array returns NIL

Iterate the array `arr` with a hash object |int|
  hash, associating `int` as the key, increment the current value count

-----------------------
Data Structure:
I: Array
W: Hash with integers as key, and their counts as values
O: Hash

Algorithm:
CANNOT USE Array#count or Array#length or Array#size

< given an array `arr` >

NIL input or Empty input array returns NIL

Iterate `arr` with a hash object
  hash, associating `int` as the key, increment the current value count

Implicitly return previous methods return value
-----------------------
Code:
=end

def group_and_count(arr)
  return nil if arr.nil? || arr.empty?

  arr.each_with_object(hash = Hash.new(0)) do |int|
    hash[int] += 1
  end
end

p group_and_count([1,1,2,2,2,3]) == {1=>2, 2=>3, 3=>1}
p group_and_count([]) == nil
p group_and_count(nil) == nil
p group_and_count([1, 7, 5, -1]) == {1=>1, 7=>1, 5=>1, -1=>1}