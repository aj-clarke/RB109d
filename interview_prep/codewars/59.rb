=begin
Question:
Given two arrays of strings a1 and a2 return a sorted array r in lexicographical order of the strings of a1 which are substrings of strings of a2.

-----------------------
Questions:

Rules:
  Explicit Requirements
  - Return a sorted array of the strings of a1 which are substrings of a2

  Implicit Requirements

-----------------------
Examples:
Example 1:
a1 = ["arp", "live", "strong"]
a2 = ["lively", "alive", "harp", "sharp", "armstrong"]
returns ["arp", "live", "strong"]

Example 2:
a1 = ["tarp", "mice", "bull"]
a2 = ["lively", "alive", "harp", "sharp", "armstrong"]
returns []
-----------------------
Modeling:
a1 = ["arp", "live", "strong"]
a2 = ["lively", "alive", "harp", "sharp", "armstrong"]

Init `result` to an empty collection

Iterate each word in `a2` |word|
  Init `substrings` to a emtpy collection
  From idx 0 to end of word |si|
    From `si` to end of the word |ei|
      Into `substrings` push `word` from `si` to `ei` inclusive
  Iterate `substrings` |sub|
    Iterate `a1` |string|
      Push into `result` `string` if `substrings` included `string`

Sort `result`

-----------------------
Data Structure:
I: Two arrays
W: New array for results, and iteration to compile results
O: Sorted array of elements that exist as substrings in `a2` array

Algorithm:
< given two arrays `a1` and `a2` >

Init `result` to an empty collection

Iterate each word in `a2` |word|
  Init `substrings` to a emtpy collection
  From idx 0 to end of word |si|
    From `si` to end of the word |ei|
      Into `substrings` push `word` from `si` to `ei` inclusive
  Iterate `substrings` |sub|
    Iterate `a1` |string|
      Push into `result` `string` if `substrings` included `string`

Sort `result`

-----------------------
Code:
=end

def in_array(a1, a2)
  result = []

  a2.each do |word|
    substrings = []
    (0...word.size).each do |si|
      (si...word.size).each do |ei|
        substrings << word[si..ei]
      end
    end
    substrings.each do |sub|
      a1.each do |string|
        result << string if substrings.include?(string)
      end
    end
  end
  result.uniq.sort
end

p in_array(["arp", "live", "strong"], ["lively", "alive", "harp", "sharp", "armstrong"]) == ["arp", "live", "strong"]
p in_array(["tarp", "mice", "bull"], ["lively", "alive", "harp", "sharp", "armstrong"]) == []


