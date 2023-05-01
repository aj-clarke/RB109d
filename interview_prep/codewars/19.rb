=begin
Question:
Title Case

FIRST ATTEMPT: 31min

A string is considered to be in title case if each word in the string is either (a) capitalised (that is, only the first letter of the word is in upper case) or (b) considered to be an exception and put entirely into lower case unless it is the first word, which is always capitalised.

Write a method that will convert a string into title case, given an optional list of exceptions (minor words). The list of minor words will be given as a string with each word separated by a space. Your function should ignore the case of the minor words string -- it should behave in the same way even if the case of the minor word string is changed.

-----------------------
Questions:


Problem (Rewrite if needed else skip):


Rules:
  Explicit Requirements
  - Convert input string into title case, with an optional list of exceptions
  - Capitalize each word unless it is a word in the list of excpetions
    - Ignore exception if it is the first word (index 0)

  Implicit Requirements

-----------------------
Examples:
title_case('a clash of KINGS', 'a an the of') == 'A Clash of Kings'

-----------------------
Modeling:
'a clash of KINGS', 'a an the of') == 'A Clash of Kings'
`str` => 'a clash of KINGS'
`exceptions` = ['a','an','the','of'] (use splat operator to convert optional exptns to array)

Downcase everything
`words` = `str` to downcase then split to an array
`exceptions` map in place to downcase

`words` 0 index, capitalize

Iterate `words` from index 1 to the end of the words array
  Captialize the `word` unless `exceptions` includes `word`

Join words with a space

-----------------------
Data Structure:
I:
W:
O:

Algorithm:
< given an string `str` and an optional list of exceptions `exceptions` >
(convert optional exptns to array during method definition) set default to `nil`

Init `words` to downcasing `str` and converting the string to an array of words (delimited by spaces)

If `exceptions`` is empty
  Iterate `words` and transform in place each word to caplitalized, then join with a space
ELSE
  Set `words` at index 0 to caplital
  Transform all `exceptions` in place to downcase
  Iterate `words` from index 1 to the end of the words array
    Captialize the `word` unless `exceptions` includes `word`

Join words with a space

-----------------------
Code:
=end

def title_case(str, exceptions = '')
  words = str.downcase.split
  p exceptions
  exceptions = exceptions.split unless exceptions.empty?


  if exceptions.empty?
    words.map! { |word| word.capitalize }.join(' ')
  else
    exceptions.map! { |word| word.downcase }
    (0...words.size).map do |idx|
      if idx > 0 && exceptions.include?(words[idx])
        words[idx]
      else
        words[idx].capitalize!
      end
    end.join(' ')
  end
end

p title_case('a clash of KINGS', 'a an the of') == 'A Clash of Kings'
p title_case('THE WIND IN THE WILLOWS', 'The In') == 'The Wind in the Willows'
p title_case('the quick brown fox') == 'The Quick Brown Fox'
