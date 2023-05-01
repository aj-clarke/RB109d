=begin
Question:
You are given a string of words, for each word within the string you need to turn the word 'inside out'. By this I mean the internal letters will move out, and the external letters move toward the centre.

Self inflicted difficulty increase. Cannot use #reverse method

If the word is even length, all letters will move. If the length is odd, you are expected to leave the 'middle' letter of the word where it is.

An example should clarify:

'taxi' would become 'atix' 'taxis' would become 'atxsi'

-----------------------
Rules:
  Explicit Requirements
  - Turn each word inside out, essentially reversing sides
  - If the string is odd, the middle char should not move
  - Do not use #reverse

  Implicit Requirements

-----------------------
Examples:
inside_out('man i need a taxi up to ubud') == 'man i ende a atix up to budu'

-----------------------
Modeling:
'take me to semynak' == 'atek me to mesykan'

`str` => 'take me to semynak'

Init `arr` to `str` convertet to an array of words => ['take', 'me', 'to', 'semynak']

Reassign `arr` to transforming words as required with index (turning words inside out) |word|
  IF THE WORD IS GREATER than 3 in length => 'take' : size is 4 : -1 for zero idx => 3 : div 2 = 1
    IF SIZE OF WORD IS EVEN
      Init `front1` to 0
      Init `front2` equal to (`word`size minus 1) / 2 = up to first half
      Init `back1` eqaul to `front2` plus 1
      Init `back2` equal to size of word - 1
      START A LOOP
        REASSIGN `word` at `front1` idx and `word` at `front2` index to the opposite
        REASSIGN `word` at `back1` idx and `word` at `back2` to the opposite
        Increment `front1` and `back1`
        Decrement `front2` and `back2`
      BREAK OUT OF LOOP If `front1` >= `front2`
      END THE LOOP
      Set `word` as the block return value
    IF SIZE OF WORD IS ODD
      Init `front1` to 0
      Init `front2` equal to (`word`size / 2) minus 1 = up to first half
      Init `back1` eqaul to `front2` plus 2
      Init `back2` equal to size of word - 1
      START A LOOP
        REASSIGN `word` at `front1` idx and `word` at `front2` index to the opposite
        REASSIGN `word` at `back1` idx and `word` at `back2` to the opposite
        Increment `front1` and `back1`
        Decrement `front2` and `back2`
      BREAK OUT OF LOOP If `front1` >= `front2`
      Set `word` as the block return value
      END THE LOOP


    

  IF NOT GREATER than 3 in length
    `word` is the return value from the block
Join back together with a space

-----------------------
Data Structure:
I: String
W: Converting string into an array of words to transform words as required
O: New transformed string

Algorithm:
< given a string `str` >

Init `arr` to `str` convertet to an array of words

Reassign `arr` to transforming words as required with index (turning words inside out) |word|
  IF THE WORD IS GREATER than 3 in length
    IF SIZE OF WORD IS EVEN
      Init `front1` to 0
      Init `front2` equal to (`word`size minus 1) / 2 = up to first half
      Init `back1` eqaul to `front2` plus 1
      Init `back2` equal to size of word - 1
      START A LOOP
        REASSIGN `word` at `front1` idx and `word` at `front2` index to the opposite
        REASSIGN `word` at `back1` idx and `word` at `back2` to the opposite
        Increment `front1` and `back1`
        Decrement `front2` and `back2`
        BREAK OUT OF LOOP If `front1` >= `front2`
      END THE LOOP
      Set `word` as the block return value
    IF SIZE OF WORD IS ODD
      Init `front1` to 0
      Init `front2` equal to (`word`size / 2) minus 1 = up to first half
      Init `back1` eqaul to `front2` plus 2
      Init `back2` equal to size of word - 1
      START A LOOP
        REASSIGN `word` at `front1` idx and `word` at `front2` index to the opposite
        REASSIGN `word` at `back1` idx and `word` at `back2` to the opposite
        Increment `front1` and `back1`
        Decrement `front2` and `back2`
        BREAK OUT OF LOOP If `front1` >= `front2`
      END THE LOOP
      Set `word` as the block return value
  IF NOT GREATER than 3 in length
    `word` is the return value from the block
Join back together with a space
-----------------------
Code:
=end

def inside_out(str)
  arr = str.split

  arr.map! do |word|
    if word.size > 3
      if word.size.even?
        front1 = 0
        front2 = (word.size - 1) / 2
        back1 = front2 + 1
        back2 = word.size - 1
        loop do
          word[front1],word[front2] = word[front2],word[front1]
          word[back1],word[back2] = word[back2],word[back1]
          front1 += 1
          front2 -= 1
          back1 += 1
          back2 -= 1
          break if front1 >= front2
        end
        word
      else
        front1 = 0
        front2 = (word.size / 2) - 1
        back1 = front2 + 2
        back2 = word.size - 1
        loop do
          word[front1],word[front2] = word[front2],word[front1]
          word[back1],word[back2] = word[back2],word[back1]
          front1 += 1
          front2 -= 1
          back1 += 1
          back2 -= 1
          break if front1 >= front2
        end
        word
      end
    else
      word
    end
  end
  arr.join(' ')
end

p inside_out('man i need a taxi up to ubud') == 'man i ende a atix up to budu'
p inside_out('what time are we climbing up the volcano') == 'hwta item are we milcgnib up the lovcona'
p inside_out('take me to semynak') == 'atek me to mesykan'
p inside_out('massage yes massage yes massage') == 'samsega yes samsega yes samsega'
p inside_out('take bintang and a dance please') == 'atek nibtgna and a adnec elpesa'