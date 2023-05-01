=begin
Question:
Write Number in Expanded Form

FIRST PASS:  25:11
You will be given a number and you will need to return it as a string in Expanded Form.

NOTE: All numbers will be whole numbers greater than 0.

-----------------------
Rules:
  Explicit Requirements
  - Return number as a string in expanded form
  - All numbers will be whole numbers (integers) greater than 0

  Implicit Requirements

-----------------------
Examples:
expanded_form(12); # Should return '10 + 2'
expanded_form(42); # Should return '40 + 2'
expanded_form(70304); # Should return '70000 + 300 + 4'

-----------------------
Modeling:
70304 => '70000 + 300 + 4'

Init `result` to an empty string

Get the first integer in the number if the number is greater than 1 in length

If `int` size when converted to string > 1
  70304 to string then its size => '70304' => 5                   '304' => 3
    Init temp `num` to:
    Get first char from the converted string      => '7'          '3'
    Concat (5-1) 0's into `num`                   => '70000'      '300'
    Push `num` into `result`                      => '70000'      '70000 + 300'
    Push ' + ' into `result`                      => '70000 + '   '70000 + 300 + '
    `input_int` -= `num` converted to an integer  => 304          4
Else
  push `int` converted to a string into `result`                  '70000 + 300 + 4'

-----------------------
Data Structure:
I: Integer
W: Convertsions
O: String

Algorithm:
< given an integer `int` >

Init `result` to an empty string ''

If `int` size when converted to string > 1
  Init `str_size` to converting `int` to string then obtaining its size
  Init temp `num` to getting first char from the converted string
  Concat '0's times `str_size-1` into `num`
  Push `num` into `result`
  Push ' + ' into `result`
  Reassign `int` equal to `int` minus `num` (converted to an integer)
Else
  push `int` converted to a string into `result`

-----------------------
Code:
=end

# def expanded_form(int)
#   result = ''

#   loop do
#     if int.to_s.size > 1
#       str_size = int.to_s.size
#       num = int.to_s[0]
#       num << '0' * (str_size - 1)
#       num << ' + '
#       result << num
#       int -= num.to_i
#     else
#       result << int.to_s
#       break
#     end
#   end
#   result
# end

def expanded_form(int)
  result = ''

  loop do
    if int.to_s.size > 1 && int > 0
      str_size = int.to_s.size
      num = int.to_s[0]
      num << ('0' * (str_size - 1))
      if (int - num.to_i) > 0
        num << ' + '
      end
      result << num
      int -= num.to_i
    else
      result << int.to_s
      break
    end
    break if int < 1
  end
  result
end

p expanded_form(12) == '10 + 2'
p expanded_form(42) == '40 + 2'
p expanded_form(70304) == '70000 + 300 + 4'
p expanded_form(90000) == '90000'
