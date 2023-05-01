=begin
Question:
Write a function
triple_double(num1, num2)
which takes numbers num1 and num2 and returns 1 if there is a straight triple of a number at any place in num1 and also a straight double of the same number in num2.
If this isn't the case, return 0

---------------------
Rules:
  Explicit Requirements
  - Write a method that returns 1 if a number repeats 3 times in the first int, and 2 times in the second

  Implicit Requirements

-----------------------
Examples:
triple_double(451999277, 41177722899) == 1
# num1 has straight triple 999s and num2 has straight double 99s
triple_double(1222345, 12345) == 0
# num1 has straight triple 2s but num2 has only a single 2

-----------------------
Modeling:
451999277, 41177722899 == 1
[999],     [11,77,77,22,99]

num1 => 451999277
num2 => 41177722899

sub1 = []
sub2 = []

Iterate `num1` to get a starting idx |start_idx|
  Iterate `num1` to get a ending idx |end_idx|
    Push in any subarrays into `sub1` that are 3 digits in length and also the same number repeated
      break up the subarray into digits and if all? are the same add that subarray


Iterate `num2` to get a starting idx |start_idx|
  Iterate `num2` to get a ending idx |end_idx|
    Push in any subarrays into `sub2` that are 2 digits in length and also the same number repeated
      break up the subarray into digits and if all? are the same add that subarray
  
sub1 = [999]
sub2 = [11,77,77,22,99]

Iterate `sub2` and if any ele is equal to `sub1`[0..1] return 1: else return 0

-----------------------

Data Structure:
I: Two integers 
W: Two subarrays
O: 1 or 0 depending on if triple/double was found or not

Algorithm:
< given two numbers `num1` and `num2`
num1 = num1.digits.reversed
num2 = num1.digits.reversed

Init `sub1` to an empy colleciton
Init `sub2` to an empy colleciton

Iterate `num1` to get a starting idx |start_idx|
  Iterate `num1` to get a ending idx |end_idx|
    Push in any subarrays into `sub1` that are 3 digits in length and also the same number repeated
      if all? are the same numbers add that subarray


Iterate `num2` to get a starting idx |start_idx|
  Iterate `num2` to get a ending idx |end_idx|
    Push in any subarrays into `sub2` that are 2 digits in length and also the same number repeated
      if all? are the same numbers add that subarray

Iterate `sub2` and if any ele is equal to `sub1`[0..1] return 1: else return 0
-----------------------
Code:
=end

def triple_double(num1, num2)
  num1 = num1.digits.reverse
  num2 = num2.digits.reverse
  
  sub1 = []
  sub2 = []

  (0...num1.size).each do |start_idx|
    (start_idx+1...num1.size).each do |end_idx|
      sub = num1[start_idx..end_idx] if num1[start_idx..end_idx].size.eql?(3)
        # if !sub.nil? && !sub.empty?
        #   if (sub.all? { |num| num == sub[0] })
        #     sub1 << sub
        #   end
        # end
    end
  end

  (0...num2.size).each do |start_idx|
    (start_idx+1...num2.size).each do |end_idx|
      sub = num2[start_idx..end_idx] if num2[start_idx..end_idx].size.eql?(2)
        if !sub.nil? && !sub.empty?
          if (sub.all? { |num| num == sub[0] })
            sub2 << sub
          end
        end
    end
  end
  
  sub2.any? { |num| num[0].eql?(sub1[0][0]) } ? 1 : 0
end

p triple_double(12345, 12345) == 0
p triple_double(666789, 12345667) == 1




def find_triples(arr)
  arr = arr.slice_when { |i, ii| i != ii }.to_a
  arr.select! { |subarr| subarr.size >= 3 }
end

def find_doubles(arr)
  arr = arr.slice_when { |i, ii| i != ii }.to_a
  arr.select! { |subarr| subarr.size >= 2 }
end

def triple_double(num1, num2)
  triples = find_triples(num1.digits.reverse)
  doubles = find_doubles(num2.digits.reverse)

  triple = triples.select { |subarr| doubles.any? { |sub| sub.include?(subarr[0]) } }
  double = doubles.select { |subarr| triples.any? { |sub| sub.include?(subarr[0]) } }

  !triple.empty? && !double.empty? ? 1 : 0
end


def triple_double(num1, num2)
  num1 = num1.to_s
  num2 = num2.to_s

  num1.each_char do |char|
    return 1 if num1.include?(char * 3) && num2.include?(char * 2)
  end

  0
end