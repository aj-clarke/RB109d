=begin
Question:
Find the unique number
FIRST ATTEMPT: 11:30 mins | SECOND ATTEMPT: 10:11

There is an array with some numbers. All numbers are equal except for one. Try to find it!

find_uniq([ 1, 1, 1, 2, 1, 1 ]) == 2
find_uniq([ 0, 0, 0.55, 0, 0 ]) == 0.55
It’s guaranteed that array contains at least 3 numbers.

The tests contain some very huge arrays, so think about performance.

-----------------------
Questions:

Problem (Rewrite if needed else skip):

Rules:
  Explicit Requirements
  - An array of numbers has 1 unique number, the rest are all duplicates, find the unique one

  Implicit Requirements

-----------------------
Examples:
find_uniq([1,1,1,1,0]) == 0
find_uniq([ 1, 1, 1, 2, 1, 1 ]) == 2
find_uniq([ 0, 0, 0.55, 0, 0 ]) == 0.55

-----------------------
Modeling:
[1,1,1,1,0] == 0

Obtain the total count for all unique numbers in the input Array

{1 => 4, 0 => 1}

Return 0

-----------------------
Scratch Pad:


-----------------------
Data Structure:
I: Array
W: Hash represting the count of each integer in the input array
O: Unique integer

Algorithm:
< given an array `arr` >

Iterate through the input array `arr`, initialize hash here as well
  Increment the value (count) of the integer from the input Array by 1

Iterate through the hash, return the key (integer) with the value of 0
-----------------------
Code:
=end

def find_uniq(arr)
  arr.each_with_object(hash = Hash.new(0)) do |int, hash|
    hash[int] += 1
  end
  hash.each do |k, v|
    return k if v.eql?(1)
  end
end

p find_uniq([1,1,1,1,0]) == 0
p find_uniq([ 1, 1, 1, 2, 1, 1 ]) == 2
p find_uniq([ 0, 0, 0.55, 0, 0 ]) == 0.55


=begin
SECOND ATTEMPT

Rules:
  Explicit Requirements
  - Find the unique number in the input array
  - Array will have at least 3 numbers

  Implicit Requirements

-----------------------
Examples:
find_uniq([ 1, 1, 1, 2, 1, 1 ]) == 2
find_uniq([ 0, 0, 0.55, 0, 0 ]) == 0.55

-----------------------
Modeling:
[ 1, 1, 1, 2, 1, 1 ] == 2

`arr` = [ 1, 1, 1, 2, 1, 1 ]

# `hsh` = Tally of `arr` if allowed = {1=> 5, 2=> 1}

If no tally allowed, use each with object iteration (hash object)
  Associate number as key, and increment its value each time it is the current number being iterated

Find the minimum value by the values from the hash, then return the `hsh` key with the lowest value

-----------------------

Data Structure:
I: Array of numbers
W: Hash of number/count pairs
O: Number not equal to the others (the unique number)

Algorithm:
< given an array `arr` >

Iterate the input array `arr` with a hash object |num|
  Associate `num` as key, and increment its value each time it is the current number being iterated

Find the minimum value by the values from the hash, then return the hash key with the lowest value
-----------------------
Code:
=end

def find_uniq(arr)
  arr.each_with_object(hash = Hash.new(0)) do |num|
    hash[num] += 1
  end
  hash.min_by { |_,v| v }[0]
end

p find_uniq([1,1,1,1,0]) == 0
p find_uniq([ 1, 1, 1, 2, 1, 1 ]) == 2
p find_uniq([ 0, 0, 0.55, 0, 0 ]) == 0.55