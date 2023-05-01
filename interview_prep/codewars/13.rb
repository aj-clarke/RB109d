=begin
Question:
Modify the kebabize function so that it converts a camel case string into a kebab case.

kebabize('camelsHaveThreeHumps') // camels-have-three-humps
kebabize('camelsHave3Humps') // camels-have-humps
Notes:

the returned string should only contain lowercase letters

-----------------------
Rules:
  Explicit Requirements
  - Convert camel case string (theString) into a kebab case string (the-string)

  Implicit Requirements
  - Per test cases, kebab case string strips out numbers

-----------------------
Examples:
p kebabize('myCamelCasedString') == 'my-camel-cased-string'
p kebabize('myCamelHas3Humps') == 'my-camel-has-humps'

-----------------------
Modeling:
'myCamelHas3Humps' == 'my-camel-has-humps'

`str` = 'myCamelHas3Humps'

Init `alpha` to the alphabet

Init `chars` to `str` converted to characters in an array

IF ALL CHARS are not in `alpha`
  Init `delete_idx` = nil
  Iterate each with index |char, idx|
    if the current `char` is not included in the `alpha` array, then reassign `delete_idx` to `idx`
  Delete from `chars` the index at `delete_idx`

Init `chars_size` to the size of the `chars` array

Init `new_str` to an empty string

Iterate `chars` with index positions to build new string |char, idx|
  Init `new_word` to an empty string
    IF: the current `char` is equal to `char.downcase` and is not the last `idx`
      Push 'char' into `new_word`
    ELSE IF: `char` is not equal to `char.downcase`
      Concatenate a '-' into `new_string` and push it into `new_word`
      Reassign `new_word` to an empty string
      Push `char` downcased into `new_word`
    ELSE
      Push 'char' into `new_word`

-----------------------
Data Structure:
I: camelCase string
W: Building a new string
O: New kebab-string

Algorithm:
< given a string `str` >

Init `alpha` to an array of the alphabet

Init `chars` to `str` converted to characters in an array

IF ALL CHARS are not in `alpha`
  Init `delete_idx` = nil
  Iterate each with index |char, idx|
    if the current `char` is not included in the `alpha` array, then reassign `delete_idx` to `idx`
  Delete from `chars` the index at `delete_idx`

Init `chars_size` to the size of the `chars` array

Init `new_str` to an empty string

Iterate `chars` with index positions to build new string |char, idx|
  Init `new_word`
    IF: the current `char` is equal to `char.downcase` and is not the last `idx`
      Push 'char' into `new_word`
    ELSE IF: `char` is not equal to `char.downcase`
      Concatenate a '-' into `new_string` and push it into `new_word`
      Reassign `new_word` to an empty string
      Push `char` downcased into `new_word`
    ELSE
      Push 'char' into `new_word`
-----------------------
Code:
=end

def kebabize(str)
  alpha = ('a'..'z').to_a
  chars = str.chars
  chars_del = []

  delete_idx = nil
  chars.each_with_index do |char, idx| # ziar50
    chars_del << delete_idx = idx if !alpha.include?(char.downcase)
  end

  chars_del.reverse!

  while chars_del.size > 0
    chars.delete_at(chars_del[0])
    chars_del.delete_at(0)
  end

  chars_size = chars.size
  new_str = ''
  new_word = ''

  chars.each_with_index do |char, idx|
    if idx.eql?(0) && !char.eql?(char.downcase)
      new_word << char.downcase
    elsif char.eql?(char.downcase) && idx != (chars.size - 1)
      new_word << char
    elsif !char.eql?(char.downcase) && idx != (chars.size - 1)
      new_word << '-'
      new_str << new_word
      new_word = ''
      new_word << char.downcase
    elsif !char.eql?(char.downcase) && idx == (chars.size - 1)
      new_word << '-'
      new_word << char.downcase
      new_str << new_word
    else
      new_word << char
      new_str << new_word
    end
  end

  new_str
end

p kebabize('myCamelCasedString') == 'my-camel-cased-string'
p kebabize('myCamelHas3Humps') #== 'my-camel-has-humps'
# Tons of extra statements to handle codewars edge cases