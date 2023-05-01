- Do not say "method", instead say method definition or method invocation/method call
- Do not say "result", instead talk about "output", "return value", and "mutations"
- Be consistend when talking about variable assignment, a value is assigned to a variable, not the other way around
- Use "evaluates to true" or "is truthy" when discussing expressions that evaluate to `true` in a boolean context
- Do not use "is true" or "is equal to true" unless you really are talking about the boolean `true`
- Be conscise, don't beat around the bush too much
- Divide your answers into paragraphs
- Do not say `a` is "hello", instead say `a` is initialized and the value "string" is assigned to it
- Make sure to distinguish between method parameters and arguments: a method is defined with parameters but is called with arguments.

# Vocabulary to keep in mind
```ruby
def foo(string)
  ...
end
```
- We are defining a method called `foo` which takes one parameter named `string`

----------

```ruby
foo('hello')
```
- We are invoking the `foo` method, and passing in the string literal `'hello'` as an argument

----------

```ruby
var = 'hello'
```
- (PDF Way) We are initializing a local varaible called `var` to the string `'hello'`
- (My Way) We initialize local variable `var` and assigning to it the string object with the value `'hello'`
- (Another suggested way) We initialize local variable `var` and assign it to the string `'hello'`

----------
```ruby
a = 'hello'
b = a
a = 'goodbye'
```
- On `line 37` we initialize local variable `a` and assign it to the string object with a value `'hello'`. On `line 38` we initialize local variable `b` to the string object referenced by local variable `a`. Both currently referenced the same string object with the value `'hello'`. On `line 39` we re-assign local variable `a` and assign it to a new string object with the value `'goodbye'`. Now `a` references (or points to) the string object with the value `'goodbye'`, while `b` references the string object with the value `'hello'`.
- This is an example of variables as pointers and how variables do not actually contain values; they are instead pointers to a specific area within memory which contains the value.

----------

```ruby
puts 'hello'
```
- The `puts` method is invoked and we pass into it the string literal `hello`. This invocation will output `hello`, and returns `nil`

----------

```ruby
i = 10
loop do
  i -= 1  # i.-(1)
  break if i == 0
end
```
- On `line 45` we initialize local variable `i` and assign to it the integer value `10`.
On `line 46` we call the `loop` method and pass it a `do..end` block from `lines 46 to 49` as an argument. 
 Inside of the block, we are reassigning the local variable `i` to the return value of the `Integer#-` method called on the local variable `i` with the integer `1` passed to it as an argument.
 We break out of the loop with the keyword `break` if the value of the object that local variable `i` is referencing is equal to `0`, and `nil` is returned.

 ----------

```ruby
def example(str)
 i = 3
 loop do
   puts str
   i -= 1
   break if i == 0
 end
end

example('hello')
```
- On `lines 68 to 75` we define the method `example` which takes one parameter of `str`.
- On `line 77` we call the method `example` and pass in the string literal `hello` as an argument. On `line 68` we bind the string `hello` to the method local variable `str`. Within the method, on `line 69`, we initialize the method local varible `i` and assign it the integer value `3`.
- On `line 70` we call the `loop` method and pass in the `do..end` block from `line 70 to 74`. The `puts` method is called, passing in `str` which outputs `hello`. On `line 72`, we call the `Integer#-` method on method local variable `i` and pass in the integer `1` as an argument. This decrements the value referenced by `i` on each loop. On `line 73` we use the `break` keyword to break out of the loop `if` the value referenced by `i` is equal to `0`, and return `nil`.
This is an example of method invocation, looping with the `loop` method, and implicit return values.
