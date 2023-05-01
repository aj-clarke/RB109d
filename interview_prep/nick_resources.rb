# creating pairs of elements from a given array
arr = [1, 2, 3, 4, 5, 6, 7, 8]
result = []

(0...arr.size).each do |outer|
  (outer+1...arr.size).each do |inner|
    result << [arr[outer], arr[inner]]
  end
end

# creating substrings and adding to an array
str = 'hello there happy studies'
substrings = []

(0...str.size).each do |outer|
  (outer...str.size).each do |inner|
    substrings << str[outer..inner]
  end
end

# can add the step method if we want to only modify elements at certain indices
# for example, if we wanted to grab every second index

string = "we only want every other word"
words = string.split
result = []

(0...words.size).step(2) do |i|
  result << words[i]
end

#-----------------------------
# TEST FOR A PRIME NUMBER
def is_prime?(num)
  !((2...num).any? { |i| num % i == 0 })
end

def minimum_number(arr)
  sum = arr.sum
  current_num = 0

  until is_prime?(sum + current_num)
    current_num +=1
  end

  current_num
end
#----------------------------