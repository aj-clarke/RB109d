#DYLAN SOLUTION
def alphabet_position(str)
  alphabet = ('a'..'z').zip(1..26).to_h
  str.downcase.chars.each.with_object([]) do |char, result|
    next if char =~ /[^a-z]/
    result << alphabet[char]
  end.join(' ')
end