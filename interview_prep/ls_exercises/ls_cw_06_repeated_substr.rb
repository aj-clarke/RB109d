=begin
Question:
Repeated substring
FIRST: ? | SECOND: 29? | THIRD: 18
For a given nonempty string find a minimum substring and the maximum number it is repreated, such that the entire substring is equal to `string` repeated X times.

The input string consists of lowercase characters.

Your method should return :

an array [substring, times repeated (integer)]

-----------------------
Questions:

Problem (Rewrite if needed else skip):

Input: String
Output: Substring that when multiplied 'x' times equals input string
Rules:
  Explicit Requirements
  - String will not be empty
  - Find smallest repeating substring and the count of how many times it is repeated to represent the full input String
  - String will always be lowercase letters

  Implicit Requirements
  - If no substring exists, input string should be returned with 1 as the count
-----------------------
Modeling:
"ababab" == ["ab", 3]
'ababab'
get all substrings up to half the size of the input string
working with 'aba' to get substrings
['a', 'ab', 'aba', 'b', 'ba', 'a'].uniq => ['a', 'ab', 'aba', 'b', 'ba']

'a' > 'ababab' => get size of 'a' and size of 'ababab' > 1 and 6
divide size of string by size of substring to get how many times you need to multiply the substring to equal the size of the string.
Take result of 6/1 then mulitply the substing by this result; 6 * 1
'a' * 6 => 'aaaaaa' is it equal to 'ababab'; yes? return result ; no keep trying
return [input_string, 1]

-----------------------
Examples:
s = "ababab"

-----------------------
Scratch Pad:


-----------------------
Data Structure:
I: String
W: Array of substrings > Array for result
O: Array with result `[string, integer_count]`

Algorithm:
< given a string as input >
If the string is odd, return the [input_str, 1]
Initialize substring to empty collection

Iterate through half of the string |outer|
  Iterate through half of the string for substring creation |inner|
    Create substrings here

Divide size of input string by the size of the substring.
  Take that result and multiply the substring to return a string of equal length of the input String 
    If new string is equal to input String
      return the substring and how many times it was repeated to equal the input String



-----------------------
Code:
=end

def repeated_substring(str)
  substrings = []

  (0...(str.size / 2)).each do |outer|
    (outer...(str.size / 2)).each do |inner|
    substrings << str[outer..inner]
    end
  end

  substrings.each do |sub|
    multiplier = str.size / sub.size
    test = sub * multiplier
    test == str ? (return [sub, multiplier]) : next
  end

  return [str, 1]
end

p repeated_substring("adad") == ["ad", 2]
p repeated_substring("ababab") == ["ab", 3]
p repeated_substring("abcde") == ["abcde", 1]


=begin
SECOND PASS 29 mins
(used wrong starting point on inner iteration wasting 12 mins)

Rules:
  Explicit Requirements
  - Find smallest repeating substring that can equal the input string after being repeated `x` times
  - Return that substring and the number of times it must repeat to equal the input string

  Implicit Requirements

-----------------------
Examples:
Example #1:
"ababab" == ["ab", 3]

Example #2:
"abcde" == ["abcde", 1]

because for this string "abcde" the minimum substring t, such that s is t repeated k times, is itself.

-----------------------
Modeling:
"ababab" == ["ab", 3]
 012

 0 to 0 is => a => (str size / size of substring) => 1 => 1 * 6 is 6 => 'a' * 6 => 'aaaaaa'

`result` placeholder for substring and count

Nested iteration:
  Iterate through `str` for starting index |start_idx| from first index to halfway through str
    Iterate through `str` for ending index |end_idx| from `start_idx` to halfway through str
      substr_size is equal to size of str`start_idx`..`end_idx` => 'ab' => 2
      multiply_by = string size / substr_size
      IF str`start_idx`..`end_idx` * multiply_by is equal to `str`
        into `result`, push str`start_idx`..`end_idx`, multiply_by

Return result

-----------------------

Data Structure:
I: String
W: Array
O: Two element array; Min substring, and num of times it needs to be repeated to equal input str

Algorithm:
< given a string `str` >

Init `result` to an empty collection

  Iterate through `str` for starting index |start_idx| from first index to halfway through str
    Iterate through `str` for ending index |end_idx| from `start_idx` to halfway through str
      # Init substr_size is equal to size of str`start_idx`..`end_idx` => 'ab' => 2
      multiply_by = string size / size of current substring (str`start_idx` to `end_idx`)
      IF str`start_idx` to `end_idx` * multiply_by is equal to `str`
        into `result`, push str`start_idx` to `end_idx` and multiply_by as its two elements

Return `result`
-----------------------
Code:
=end

# def min_substring(str)
#   result = []

#   (0...str.size).each do |start_idx|
#     (start_idx...str.size).each do |end_idx|
#       multiply_by = str.size / str[start_idx..end_idx].size
#       if str[start_idx..end_idx] * multiply_by == str
#         result << str[start_idx..end_idx]
#         result << multiply_by
#         return result
#       end
#     end
#   end
# end

# Nicer Solution
def min_substring(str)
  (0...str.size).each do |start_idx|
    (start_idx...str.size).each do |end_idx|
      substring = str[start_idx..end_idx]
      multiplier = str.size / substring.size
      return [substring, multiplier] if (substring * multiplier).eql?(str)
    end
  end
end


p min_substring("ababab") == ["ab", 3]
p min_substring("abcde") == ["abcde", 1]
p min_substring("abcabcabc") == ['abc', 3]
p min_substring("babababababa") == ['ba', 6]