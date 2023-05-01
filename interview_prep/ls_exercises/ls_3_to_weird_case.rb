=begin
Question:
To weird case
FIRST: 42:05 | SECOND: 29:30 mins | THIRD: 20:31 | FOURTH: 23:06 | Fifth: 16:20
SIXTH: 16:00

# Write a method named to_weird_case that accepts a string, and
# returns the same sequence of characters with every 2nd character
# in every third word converted to uppercase. Other characters
# should remain the same.

-----------------------
Rules:
  Explicit Requirements
  - Returns same sequence of characters
  - Every third word should have every other character upcased starting with the second character in the word

  Implicit Requirements
  - If third word has less than two characters, do nothing
  - Validate if character is already upcased if using destructive method to avoid `nil`

I: String
O: Mutated string as required


-----------------------
Examples:
p to_weird_case('Lorem Ipsum is simply dummy text of the printing') == 'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
p to_weird_case('It is a long established fact that a reader will be distracted') == 'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case('aaA bB c') == 'aaA bB c'
p to_weird_case('Miss Mary Poppins word is supercalifragilisticexpialidocious') == 'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'

-----------------------
Modeling:
'It is a long established fact that a reader will be distracted'
'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'

new_string = Iterate through every third word via stepping through a range
      'a',               `fact`,     'reader',      'distracted'
    if word is greater than 1
      iterate through words to tranform chars with index or Range
        upcase the char if it is an odd index
        ['f', 'a', 'c', 't']
        ['f', 'A', 'c', 'T']
        set new_word equal to join the array
        'fAcT'

return new_string

-----------------------
Data Structure:
I: String
W: Array of words to mutate/transform as needed
O: Mutated string as required

Algorithm:
< given a string `str` >

Convert string to array of words
Iterate through every third word of the input string `str` via stepping through a range
  If the word is greater than 1
    Iterate through the word to tranform/map chars (with index or a range)
      Upcase the char if it is an odd Index
      Join the word back into a String

Return the mutated string

-----------------------
Code:
=end

# def to_weird_case(str)
#   words = str.split

#   (2...words.size).step(3) do |word|
#     if words[word].size > 1
#       new_word = words[word].chars.map!.with_index do |char, idx|
#         if idx.odd?
#         char = char.upcase
#         else
#           char
#         end
#       end
#       words[word]= new_word.join
#     else
#       next
#     end
#   end
#   words.join(' ')
# end

def to_weird_case(str)
  words = str.split
  idx_counter = 2

  words = words.map.with_index do |word, word_idx|
    if idx_counter.eql?(word_idx)
      idx_counter += 3
      word.chars.each_with_index do |char, char_idx|
        char.upcase! if char_idx.odd?
      end.join
    else
      word
    end
  end.join(' ')

  p words
end

p to_weird_case('Lorem Ipsum is simply dummy text of the printing') == 'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
p to_weird_case('It is a long established fact that a reader will be distracted') == 'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case('aaA bB c') == 'aaA bB c'
p to_weird_case('Miss Mary Poppins word is supercalifragilisticexpialidocious') == 'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'


#Grab every third word, capitalize every other letter starting with the second of that word

# str = 'zero one two three four five six seven eight nine ten'
# str_arr = str.split # => ['zero', 'one', 'two', 'three', 'four',....]
# counter = 2         # => Used to grab the first /third/ element 'two'
# str_arr = str_arr.map.with_index do |word, outer_idx| # iterate each element with its index position

#   if idx == counter # if the `idx` is equal to the `counter` execute `if` branch
#     counter += 3 if idx == counter
#     word = word.chars.map.with_index do |char,iidx| 
#          # word                                     # => the current word ('two' for first iteration)
#              # .chars                               # => breaks `word` ('two') into array of characters => ['t', 'w', 'o'] returns an enumerable
#                    # .map                           # => transforms each character `char` as defined in the block
#                         #.with_index                # => gets index
#       if iidx.odd?
#         char.upcase!
#       else
#         char
#       end
#     end
#     word.join
#   else
#     word
#   end
# end
# p str_arr.join(' ')


=begin
THIRD PASS

Rules:
  Explicit Requirements
  - Return same sequence of chars but:
    - Every 3rd word, upcase every 2nd char
  - All other chars/words remain the same

  Implicit Requirements

-----------------------
Examples:
p to_weird_case('Lorem Ipsum is simply dummy text of the printing') == 'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
p to_weird_case( 'It is a long established fact that a reader will be distracted') == 'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case('aaA bB c') == 'aaA bB c'
p to_weird_case( 'Miss Mary Poppins word is supercalifragilisticexpialidocious') == 'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'

-----------------------
Modeling:
'Lorem Ipsum is simply dummy text of the printing' == 'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'

First split the string into words
`words` => ['Lorem' 'Ipsum' 'is' 'simply' 'dummy' 'text' 'of' 'the' 'printing']

Find way to get to every third word via iteration

Set a `word_counter` to 2
Set `words` = Iterating through `words` with index positions |word, word_idx|
                If the `word_counter` is equal to `word_idx`
                  CHECK WORD HERE
                  Need to modify that word => `is`
                    Break `word` into chars (chain `map!`)
                      Transform `odd` indexed chars to upcase
                    Join `word` back together
                CHECK WORD HERE
              CHECK WORDS then join back to a string with space

-----------------------
Data Structure:
I: String
W: Array of words, and array of characters
O: New string manipulated based on requirements

Algorithm:
< given a string `str` >

Init `words` to splitting the `str` into words

Init `word_counter` to 2

Reassign `words` equal to:
  Iterating through `words` with index positions to transform as needed |word, word_idx|
    If the `word_counter` is equal to `word_idx`
      Increment `word_counter` by 3
      CHECK WORD HERE, then Need to modify that word based on the index position
        Break `word` into chars, iterate with index position
          Transform `odd` indexed chars to upcase
        Join `word` back together
    CHECK WORD HERE
  CHECK WORDS then join back to a string with space
-----------------------
Code:
=end

def to_weird_case(str)
  words = str.split
  word_counter = 2

  words.map.with_index do |word, word_idx|
    if word_counter.eql?(word_idx)
      word_counter += 3
      word.chars.each_with_index do |char, char_idx|
        char.upcase! if char_idx.odd?
      end.join
    else
      word
    end
  end.join(' ')
end

#--------------------

def to_weird_case(str)
  words = str.split
  counter = 2

  words.map!.with_index do |word, idx|
    if counter.eql?(idx)
      counter += 3
      word.chars.each_with_index do |char, idx|
        char.upcase! if idx.odd?
      end.join
    else
      word
    end
  end.join(' ')
end

#-------------------------------------------------------------------------------

=begin
Question:
# Write a method named to_weird_case that accepts a string, and
# returns the same sequence of characters with every 2nd character
# in every third word converted to uppercase. Other characters
# should remain the same.

-----------------------
Questions:

Rules:
  Explicit Requirements
  - For ever 3rd word, every 2nd char should be upcased
  - All other chars/words should stay the same
  - Return as a new string

  Implicit Requirements

-----------------------
Examples:
p to_weird_case('Lorem Ipsum is simply dummy text of the printing') == 'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
p to_weird_case('It is a long established fact that a reader will be distracted') == 'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case('aaA bB c') == 'aaA bB c'
p to_weird_case('Miss Mary Poppins word is supercalifragilisticexpialidocious') == 'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'

-----------------------
Modeling:
'It is a long established fact that a reader will be distracted' == 'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'

`str` => 'It is a long established fact that a reader will be distracted'

First split the string into words
Find way to get to every third word via iteration

Init `words` to `str` converted to an array of individual words
Init `counter` to 2

Iterate to transform `words` with idx positions |word, word_idx|
  IF CURRENT WORD `word_idx` is equal to `counter`
    Increment `counter` by 3
    Convert `word` to an array of chars, and iterate each char with idx positions |char, char_idx|
      Destructively upcase the `char` if `char_idx` is odd
    Join array back to a string before ELSE
  ELSE
    Make `word` blocks return val
Join the `words` back into a string with a space

-----------------------
Data Structure:
I: String
W: Array of words and chars to transform as needed
O: New Mutated string

Algorithm:
< given a string `str` >

Init `words` to `str` converted to an array of individual words
Init `counter` to 2

Iterate to transform `words` with idx positions |word, word_idx|
  IF CURRENT WORD `word_idx` is equal to `counter`
    Increment `counter` by 3
    Convert `word` to an array of character elements, and iterate each element (character) with idx positions |char, char_idx|
      Destructively upcase the `char` if `char_idx` is odd
    Join array back to a string before ELSE
  ELSE
    Make `word` blocks return val
Join the `words` back into a string with a space
-----------------------
Code:
=end

def to_weird_case(str)
  words = str.split
  counter = 2

  words.map.with_index do |word, word_idx|
    if word_idx.eql?(counter)
      counter += 3
      word.chars.each_with_index do |char, char_idx|
        char.upcase! if char_idx.odd?
      end.join
    else
      word
    end
  end.join(' ')

end

p to_weird_case('Lorem Ipsum is simply dummy text of the printing') == 'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
p to_weird_case('It is a long established fact that a reader will be distracted') == 'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case('aaA bB c') == 'aaA bB c'
p to_weird_case('Miss Mary Poppins word is supercalifragilisticexpialidocious') == 'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'