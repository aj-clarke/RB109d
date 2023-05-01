=begin
Question:
Delete Occurrences of Extra Elements in an Array

FIRST: 31:30 mins

Create a function that takes two arguments: an array `arr` and a number `num`. If an element occurs in `arr` more than `num` times, remove the extra occurrence(s) and return the result.

Notes
Do not alter the order of the original array.

-----------------------
Questions:

Rules:
  Explicit Requirements
  - If element occurs in input array more than `num` times, remove the extra occurences
  - Return new result

  Implicit Requirements

-----------------------
Examples:
deleteOccurrences([1, 1, 1, 1], 2) ➞ [1, 1]

deleteOccurrences([13, true, 13, null], 1) ➞ [13, true, null]

deleteOccurrences([true, true, true], 3) ➞ [true, true, true]

-----------------------
Modeling:
[1, 2, 3, 1, 1, 2, 1, 2, 3, 3, 2, 4, 5, 3, 1],3 == [1, 2, 3, 1, 1, 2, 2, 3, 3, 4, 5]

`arr` => [1, 2, 3, 1, 1, 2, 1, 2, 3, 3, 2, 4, 5, 3, 1]
`max_occurences` => 3

Init `hash` one of 2 ways:
  Each with hash object
  #tally Method

`hash` => {1 => 5, 2 => 4, 3 => 4, 4 => 1, 5 => 1}

Iterate `hash` and alter as needed |_, val|
  IF `val`  is greater than `max_occurences`
    SET `val` equal to `val` - `max_occurences`
  IF NOT
    SET `val` equal to 0

`hash` => {1 => 2, 2 => 1, 3 => 1, 4 => 1, 5 => 1} 

Reassign `arr` to `arr` reversed

Iterate `hash`, for each |key, val|
  Until `val` is equal to 0 => 1
    Init `arr_idx` to finding index of `key` in `arr`
    Within `arr` delete at `arr_idx` index position
    Decrement `val` by 1
  END UNTIL

Reverse `arr` destructively
-----------------------
Data Structure:
I: Array
W: Hash of key/value pairs to facilitate removing extra occurrences
O: Mutated array based on removal requirements

Algorithm:
< given an array `arr` and a number `num` >

Init `hash` to a key/value pair of element/counts

`hash` => {1 => 5, 2 => 4, 3 => 4, 4 => 1, 5 => 1}

Iterate `hash` and alter as needed |_, val|
  IF `val`  is greater than `max_occurences`
    SET `val` equal to `val` - `max_occurences`
  IF NOT
    SET `val` equal to 0

`hash` => {1 => 2, 2 => 1, 3 => 1, 4 => 1, 5 => 1} 

Reassign `arr` to `arr` reversed

Iterate `hash`, for each |key, val|
  Until `val` is equal to 0
    Init `arr_idx` to finding index of `key` in `arr`
    Within `arr` delete at `arr_idx` index position
    Decrement `val` by 1
  END UNTIL

Reverse `arr` destructively
-----------------------
Code:
=end

#or iterate once, and push into a `new_arr` if the count in `new_arr` is less than input `num`

def deleteOccurrences(arr,num)
  hash = arr.tally

  hash = hash.map do |key,val|
    if val > num
      val -= num
      [key, val]
    else
      val = 0
      [key,val]
    end
  end.to_h
  arr.reverse!

  hash.each do |key, val|
    while val > 0
      arr_idx = arr.index(key)
      arr.delete_at(arr_idx)
      val -= 1
    end
  end
  arr.reverse!
end

p deleteOccurrences([1, 1, 1, 1], 2) == [1, 1]
p deleteOccurrences([true, true, true], 3) == [true, true, true]
p deleteOccurrences([13, true, 13, nil], 1) == [13, true, nil]
p deleteOccurrences([], 100) == []
p deleteOccurrences(["John", "John", "Marry", "Marry"], 1) == ["John", "Marry"]
p deleteOccurrences(["Marry", "John", nil, "John", false, "John", 0, "John", "Marry", "Marry", "John"], 3) == ["Marry", "John", nil, "John", false, "John", 0, "Marry", "Marry"]
p deleteOccurrences([20, 37, 20, 21], 1) == [20, 37, 21]
p deleteOccurrences([1, 1, 3, 3, 7, 2, 2, 2, 2], 3) == [1, 1, 3, 3, 7, 2, 2, 2]
p deleteOccurrences([1, 2, 3, 1, 1, 2, 1, 2, 3, 3, 2, 4, 5, 3, 1],3) == [1, 2, 3, 1, 1, 2, 2, 3, 3, 4, 5]