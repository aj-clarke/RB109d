### 1

What does the following code return? What does it output? Why? What concept does it demonstrate?

value = 1
while value <= 99
  puts value if value.even?
  value += 1
end

The above code snippet will return `nil` and output the string representation of the integer value referenced by local variable `value` individually (on separate lines) from `2` to `98` (only even integers). On line 5, local variable `value` is initialized opinting to the integer object with the value of `1`.

ON line 6, we begin a `while` loop, which will continually loop until the parameter containing the conditional statement of calling the `<=` method on the value referenced by `value` passing in the argument of 99 evaluates to `false`. Within the loop, the `even?` method is called on the current value referenced by `value`. If the return value from the `even?` method returns `true`, the `puts` method is called passing in the value referenced by `value` as an argument, outputting the even integer. `value` is then incremented by 1 via the `+` method on line 8. When the `while` loop parameters conditional statement evaluates to `false` execution will stop and the `while` loop returns `nil`.

This code demonstrates the concepts of looping with the `while` method and `puts` vs `return`. While loops are not methods (therefore do not create a new scope) and have a parameter that evaluates to `true` or `false`. Until the parameter evaluates to `false` code within the loop will execute. Code must also advance or change the state of the parameter to evaluate to `true`to eventually exit the loop; otherwise, an infinite loop is created. The `while` loop returns `nil` once execution is stopped.

---------------------------

### 2 (8 mins)

What does the following code return? What does it output? Why? What concept does it demonstrate?

def negative(number)
  number > 0 ? -number : number
end

result = negative(3)
puts result

On line 28, the `puts` method is called passing in the value referenced by `result`. This outputs the string representation of integer `-3`, and returns `nil`.

ON line 27, local variable `result` is initialized to the result of calling the `negative` method passing in the integer literal `3` in place of the method parameter `number`. On line 24, the ternary oporator is used. The `>` method is called on the value referenced by method local variable `number` passing in integer literal `0` as an argument. If the expression evaluates to `true`, the value referenced by `number` is converted to a negative of its value; otherwise, `number` is returned as is if the ternary expression evaluates to `false`. 

The ternary return value is also the methods return value as it is the last evaluated expression of the method. Local variable `result` is initialized on line 27 with the methods return value of `-3`.

This code demonstrates the use of a ternary operator and method return values for varaible assignment.

---------------------------

### 3 (8:26 mins)

What does the following code return? What does it output? Why? What concept does it demonstrate?

print 'Please write word or multiple words: '
input = gets.chomp  # => 'I like to take walks'
number_of_characters = input.delete(' ').size
puts "There are #{number_of_characters} characters in \"#{input}\"."

On line 47 the `puts` method is called, passing in a string object containing string interpolation as an argument. After the expressions `#{number_of_characters}` and `#{input}` are evaluated and their expressions are returned and conatenated with the surrounding string, the output is `There are 16 characters in "I like to take walks".` and `nil` is returned.

On line 45 the `gets` (get string) method is called which takes in user input. The `chomp` method is chained onto `gets` to remove the new line character `\n` from the user input. Local variable `input` is initialized on line 45 and points to the return value of the `gets.chomp` chained method call.

ON line 46, the `size` method is called on the return value of calling the `delete` method on the value referenced by `input` passing in the string literal ` ` as an argument. This `delete` call will remove any empty space characters from the `input` string object. Local variable `number_of_characters` is initialized and points to the return value, integer value `16`, from the chained `delete` and `size` method calls.

This code demonstrates variable assignment via user input, and the use of chaining methods to obtain expected return values.

----------------------------------------

### 4 (9:24 mins)

What does the following code return? What does it output? Why? What concept does it demonstrate?

def short_long_short(string1, string2)
  if string1.length > string2.length
    string2 + string1 + string2
  else
    string1 + string2 + string1
  end
end

a = 'hi'
b = 'there'
p short_long_short(a, b)

On line 73 the `p` method is called, passing in the return value from the method `short_long_short`. This outputs and returns the string `'hitherehi'`.

On line 71, local variable `a` is initialzied pointing to the string object with the value of `hi`. On line 72, local variable `b` is initialized pointing to the string object with the value of `there`. The `short_long_short` method call on line 73 is called passing in the values referenced by `a` and `b` in place of method parameters `string1` and `string2`.

On line 64 we use an `if` statement with the conditional parameter of calling the `<` method on the return value of the `length` method being called on the value referenced by method local variable `string1`, which returns the integer object with the value of `2` passing in the arguement of the return value from calling the `length` method on the value referenced by method local variable `string2`, which is the integer object with the value of `5`. This conditional statement evaluates to `false` executing the `else` branch.

On line 67, we use string concatenation to add the values referenced by `string1`, `string2`, and `string1` together into one new string object. This returns the string object with the value of `'hitherehi'`. This is also the return value from the method as it is the last evaluated expression of the `short_long_short` method.

This code deomonstrates the concept of method invocations and the use of if statements and string concatenation.

------------------------------

### 5 (14 mins)

What does the following code return? What does it output? Why? What concept does it demonstrate?

def stringy(size)
  numbers = []

  size.times do |index|
    number = index.even? ? 1 : 0
    numbers << number
  end

  numbers.join
end

puts stringy(6) # => '101010'

On line 102 the `puts` method is called passing in the return value of the method call `stringy(6)`. This outputs the string representation of integer `'101010'`.

The `stringy` method is called on line 102, passing in the integer literal `6` as an argument in place for the method parameter `size`. On line 92, method local variable `numbers` is initialized pointing to an empty array object.

ON line 94 the `times` method is called on the integer value referenced by `size`; `6`. A `do..end` block is defined on lines 94 to 97 with one parameter of `index` and is passed into the `times` method as an argument. The `times` method will iterate 6 times passing in an integer during each iteration. The integer count starts from `1` up to the integer it is called on. On each iteration, the current value of `size` is passed into the block and assigned to the block parameter `index`. 

On line 95 a ternary operator is used to evaluate the return value of calling the `even?` method on the value referenced by `index`. If the expression evaluates to `true`, integer literal `1` is returned, if `false` integer `2` is returned. Method local variable `number` is initialized pointing to the ternary operators return value. On line 96, the `<<` (shovel) method is called on the array referenced by `numbers`, passing in `number` as an argument. `numbers` currently references the array object `[1, 0, 1, 0, 1, 0]`.

On line 99, the `join` method is called on the `numbers` array. This method call joins all of the array elements and into one new string object and returns `'101010'`. This return value is also the return value of the `stringy` method as it is the last evaluated expression of the method.

This code demonstrates method invocation, working with arrays and ternary operators, and iteration with the `times` method.