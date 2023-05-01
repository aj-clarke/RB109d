=begin
Question:
=begin
Background
There is a message that is circulating via public media that claims a reader can easily read a message where the inner letters of each words is scrambled, as long as the first and last letters remain the same and the word contains all the letters.

Another example shows that it is quite difficult to read the text where all the letters are reversed rather than scrambled.

In this kata we will make a generator that generates text in a similar pattern, but instead of scrambled or reversed, ours will be sorted alphabetically

Requirement
return a string where:

1) the first and last characters remain in original place for each word
2) characters between the first and last characters must be sorted alphabetically
3) punctuation should remain at the same place as it started, for example: shan't -> sahn't

Assumptions

1) words are seperated by single spaces
2) only spaces separate words, special characters do not, for example: tik-tak -> tai-ktk
3) special characters do not take the position of the non special characters, for example: -dcba -> -dbca
4) for this kata puctuation is limited to 4 characters: hyphen(-), apostrophe('), comma(,) and period(.)
5) ignore capitalisation

for reference: http://en.wikipedia.org/wiki/Typoglycemia

-----------------------
Rules:
  Explicit Requirements
  - Return a string where:
    - First and last letters of each word remain in place
    - All other chars are sorted alphabetically
    - Any punctuation should remain in its original place regardles of position in any given word
    - Only punctuation will be the following: |  - ' , .  |

  Implicit Requirements
  - Empty string returns empty string

-----------------------
Examples:
p scramble_words('me') == 'me'
p scramble_words('you') == 'you'
p scramble_words('card-carrying') == 'caac-dinrrryg'
p scramble_words("shan't") == "sahn't"

-----------------------
Modeling:
'card-carrying' == 'caac-dinrrryg'

`str` => 'card-carrying'

Return the input string if the `str` size is less than 4

Init `special` equal to "-',."

Init `words` to splitting the words into an array ['card-carrying']

Iterate `words` to transform each word |word|
  IF: `word` is less than 4 chars in size
    return the word
  IF NOT:
    Convert `word` to an array of characters
    Init `temp_word` to obtaining the chars from index pos 1 to 1 before the end of the array
    IF: any? character in `temp_word` is equal to one of the `special` punctuation
      Init `spec_idx` = nil
      Init `spec_char` = nil
      Iterate `temp_word` with index pos |char, idx|
        Reassign `spec_idx` to `idx` if the current `char` is in `special`
        Reassign `spec_char` to `char` if the current `char` is in `special`
      Remove the value from `temp_word` at index position `spec_idx`
      Sort destructively `temp_word`
      Insert `spec_char` at index position `spec_idx`
    IF NOT:
    Sort destructively `temp_word`
    Insert `temp_arr` back into `word` at index pos 1
    Flatten the array, and join the word back into a string
Rejoin the `words` array with a space

  

-----------------------
Scratch Pad:
insert for string?

-----------------------
Data Structure:
I: String
W: Array of words, and array of word characters for transformation as needed
O: New string with words mutated as required

Algorithm:
< given a string `str` >

Return the input string if the `str` size is less than 4

Init `special` equal to "-',."

Init `words` to splitting the words into an array

Iterate `words` to transform each word |word|
  IF: `word` is less than 4 chars in size
    return the word
  IF NOT:
    Init `temp_word` to obtaining the chars from index pos 1 to 1 before the end of the array
    IF: any? character in `temp_word` is equal to one of the `special` punctuation
      Init `spec_idx` = nil
      Init `spec_char` = nil
      Iterate `temp_word` with index pos |char, idx|
        Reassign `spec_idx` to `idx` if the current `char` is in `special`
        Reassign `spec_char` to `char` if the current `char` is in `special`
      Remove the value from `temp_word` at index position `spec_idx`
      Sort destructively `temp_word`
      Insert `spec_char` at index position `spec_idx`
    IF NOT:
    Sort destructively `temp_word`
    Insert `temp_arr` back into `word` at index pos 1
    Flatten the array, and join the word back into a string
Rejoin the `words` array with a space
-----------------------
Code:
=end

def scramble_words(str)
  return str if str.size < 4
  
  special = "-',."

  words = str.split

  words.map do |word|
    if word.size < 4
      word
    else
      spec_idx = nil
      spec_char = nil
      temp_word = word.slice!(1...(word.size - 1)).chars
      word = word.chars
      if temp_word.any? { |char| special.include?(char)}
        temp_word.each_with_index do |char, idx|
          spec_idx = idx if special.include?(char)
          spec_char = char if special.include?(char)
        end
        temp_word.delete_at(spec_idx)
        temp_word.sort!
        temp_word.insert(spec_idx, spec_char)
        word.insert(1, temp_word).flatten
      else
        temp_word.sort!.join
        word.insert(1, temp_word).flatten
      end.join
    end
  end.join(' ')

end

# p scramble_words('professionals') == 'paefilnoorsss'
# p scramble_words('i') == 'i'
# p scramble_words('') == ''
# p scramble_words('me') == 'me'
# p scramble_words('you') == 'you'
# p scramble_words('card-carrying') == 'caac-dinrrryg'
# p scramble_words("shan't") == "sahn't"
# p scramble_words('-dcba') #== '-dbca'
# p scramble_words('dcba.') #== 'dbca.'
p scramble_words("you've gotta dance like there's nobody watching, love like you'll never be hurt, sing like there's nobody listening, and live like it's heaven on earth.") == "you've gotta dacne like teehr's nbdooy wachintg, love like ylo'ul neevr be hrut, sing like teehr's nbdooy leiinnstg, and live like it's haeevn on earth."