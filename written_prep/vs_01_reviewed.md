animal = "dog"

loop do |_|
  animal = "cat"
  var = "ball"
  break
end

puts animal
puts var

# What does the following code return? What does it output? Why? What concept does it demonstrate?

=begin
On `line 1` we initialize the local variable `animal` to the String object with value `"dog"`.

On `line 3` we invoke the `#loop` method and pass in a `do .. end` block with a single non-referenced parameter `_`. On `line 4` we reassign the outer scoped local variable `animal` to refernce the string object `"cat"`. On `line 5` we initialize the local block variable `var` to reference the string object with value `"ball"`. (break description not needed due to not being relevent to the question) On `line 6` we use the keyword `break` to end the `loop`.

On `line 9` we call the `puts` method and pass in the variable `animal` which will output the referenced string object `cat` and will return `nil`. On `line 10` we call the `puts` method passing in the variable `var` which will throw an exception code because `var` is inititialized in the defined block that is pased into the `loop` method, making it unavaible in the main (outer) scope. Because an exception is thrown, there is no return value.
The concept demonstrated is variable scoping rules. Variables initialized in an outer scope are accessible in an inner scope, but not vice versa.

=end