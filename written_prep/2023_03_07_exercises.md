### 1 (8:05 mins)

What does the following code return? What does it output? Why? What concept does it demonstrate?

def running_total(array)
  sum = 0
  array.map { |value| sum += value }
end

p running_total([2, 5, 13]) # => [2, 7, 20]

On line 10, the `p` method is called, passing in the result of the return of calling the `running_total` method passing in `[2, 5, 13]` in place of the method parameter array. This outputs and returns `[2, 7, 20]` (`p` returns its caller).

Within the `running_total` method, on line 6, method local variable `sum` is initialzied pointing to the integer object with the value `0`. On line 7, the `map` method is called on the array object referenced by `array`. A block is defined by `{}` with one block parameter of `value` and is passed into the `map` method as an argument. 

`map` will return a new array of objects based on the block's return value. On each iteration, the current element from `array` is passed in and assigned to block variable `value`. On the first iteration, the `+` method is called on the value referenced by `sum` (`0`) passing in the value referenced by `value` (2). This expression returns the integer object with the value of `2` and reassigns `sum` to this value. This iteration continues until iteration is completed for each element of `array`. Because `map` is the last evaluated expression of the method, the final iteration is the return value of the `map` method and the `running_total` method; `[2, 7, 20]`.

This code demonstrates the concept of iteration and transofrmation with the `map` method:
The `map` method is called on a collection taking a block as an argument. During each iteration, the current elements value is passed into the block and assigned to the block parameter. The code is then executed for each iteration. `map` always performs transformation via the return value of the block during each iteration. The return value of the block is the evaluated result of the last line executed, which is placed into a new collection. When the `map` method has completed iterating, the new collection is returned.

--------------------------------

### 2 (8:35 mins)

What does the following code return? What does it output? Why? What concept does it demonstrate?

def spin_me(arr)
  arr.each do |word|
    word.reverse!
  end
end

arr = ['hello', 'world']
puts spin_me(arr)

On line 34, the `puts` method is called, passing in the return value of calling the `spin_me` method passing in the array object referenced by `arr` in place of the method parameter `arr`. This outputs `'olleh'` and '`dlrow'` on separate lines, and outputs `nil`.

On line 33, local variable `arr` is initialized to an array object with the value of `['hello', 'world']`. After the `spin_me` method call... On line 28, the `each` method is called on the array referenced by method local variable `arr`. We define a `do..end` block on lines 28 to 30 with one block parameter of `word`. During each iteration, the current element from `arr` is passed into the block and assigned to the block parameter `word`. The destructive (mutating) `reverse!` method is called on the value referenced by `word`. This mutates and returns the same string object reversed on each iteration. Once iteration is completed, `each` returns its caller, which is aslo the last evaluated expression of the `spin_me` method.

This code demonstrates the concepts of mutating methods and using the `each` method for iterations.

Some methods (mutating methods) change the value or state of an object in their address space. Others (non-mutating methods) do not, they instead reassign a variable pointing to a completely different address space or return a new object that can be assigned to a variable.
When performing a method call/method invocation, and one or more arguments passed into a method are altered permanently, you are Mutating the argument. Similarly, when an object or referenced object is used to call a method is mutated (i.e.: `array.pop` permanently alters `array` by removing the last element from the array), you are Mutating the caller.

The `each` method is called on a collection taking a block as an argument. During each iteration, the current elements value is passed into the block and assigned to the block parameter. The code is then executed for each iteration, with the `each` method not considering the return value of the block, until `each` is done iterating. Once the `each` method is done iterating, it returns its caller (the ORIGINAL COLLECTION).

----------------------------------------------
### 3 (11:24 mis)

What will the following code print, and why? Don't run the code until you have tried to answer.

array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2

The above code will output (on separate lines):
Moe
Larry
CURLY
SHEMP
Harpo
CHICO
Groucho
Zeppo

On line 52, local variable `array1` is initialized pointing to the array object containing string objects as elements. On line 53, local variable `array2` is initialized to an empty array object.

On line 54, the `each` method is called on the array object referenced by `array1`. A block is defined via `{}` with a block parameter of `value`. During each iteration, the current element from `array1` is passed into the block and assigned to block local variable `value`. The `<<` (shovel) method is called on the array referenced by `array2` passing in the value referenced by `value` as an argument. This method will append each `value` into the array object referenced by `array2`. Both array objects contain elements that reference the same string objects. Any destructive (in place mutations) to one string object element will affect the string object in both arrays.

On line 55 the `each` method is called on the array object referenced by `array1`. A block is defined via `{}` with a block parameter of `value`. During each iteration, the current element from `array1` is passed into the block and assigned to block local variable `value`. We use an `if` conditional statement to determine if he destructive `upcase!` method is called on the value referenced by `value` during each iteration. The `start_with?` method is called on the value referenced by `value` passing in two arguments `C` and `S`. If `value` starts with a capitol C or a capitol S, then that value is mutated in place to have the word converted to uppercase.

When the `puts` method is called on line 56 and passed in the array referenced by `array2`, the listed code is output, and `nil` is returned.

This code demonstrates the concept of iteration with the each method and mutating methods.
The `each` method is called on a collection taking a block as an argument. During each iteration, the current elements value is passed into the block and assigned to the block parameter. The code is then executed for each iteration, with the `each` method not considering the return value of the block, until `each` is done iterating. Once the `each` method is done iterating, it returns its caller (the ORIGINAL COLLECTION).

Some methods (mutating methods) change the value or state of an object in their address space. Others (non-mutating methods) do not, they instead reassign a variable pointing to a completely different address space or return a new object that can be assigned to a variable. When performing a method call/method invocation, and one or more arguments passed into a method are altered permanently, you are Mutating the argument. Similarly, when an object or referenced object is used to call a method is mutated (i.e.: `array.pop` permanently alters `array` by removing the last element from the array), you are Mutating the caller.

----------------------------------------

### 4 (13:25 mins)

What does the following code return? What does it output? Why? What concept does it demonstrate?

def word_cap(words)
  words_array = words.split.map do |word|
    word.capitalize
  end
  words_array.join(' ')
end

puts word_cap('four score and seven') # => 'Four Score And Seven'

On line 94, the `puts` method is called passing in as an argument the return value of calling the method `word_cap` and passing in the string literal `'four score and seven'` in place of the method parameter `words`. This outputs `'Four Score And Seven'` and returns `nil`.

On line 88 after assinging `'four score and seven'` to method parameter `words`, we chain a call on the value referenced by method local variable `words`. The `split` method will convert the `words` string object into an array of string object elements delimited on spaces by default. The returned array is `['four', 'score', 'and', 'seven']`. `map` is then called on this returned array. A `do..end` block is defined from lines 88 to 90 with one block parameter of `word`. During each iteration, the current element from the split array is passed in and assigned to block parameter `word`.

Map returns a new array after transformation of each block iteration is completed. On line 89, the non-mutating `capitalize` method is called on the value referenced by `word`, and the return value of the block is appended to the new array. The new array is returned after `map` is completed iteration. Method local variable `words_array` is initialized pointing to the return value of the `map` method call; `['Four', 'Score', 'And', 'Seven'].

On line 91, the `join` method is called on the array referenced by `words_array` passing in the argument of ` ` to join each element together with a space; `Four Score And Seven`. This is the last evaluated expression of the `word_cap` method; therefore it is implicitly returned by the method.

This code demonstrates the concepts of mutating methods and transformation with the `map` method.

Some methods (mutating methods) change the value or state of an object in their address space. Others (non-mutating methods) do not, they instead reassign a variable pointing to a completely different address space or return a new object that can be assigned to a variable. 
When performing a method call/method invocation, and one or more arguments passed into a method are altered permanently, you are Mutating the argument. Similarly, when an object or referenced object is used to call a method is mutated (i.e.: `array.pop` permanently alters `array` by removing the last element from the array), you are Mutating the caller.

The `map` method is called on a collection taking a block as an argument. During each iteration, the current elements value is passed into the block and assigned to the block parameter. The code is then executed for each iteration. `map` always performs transformation via the return value of the block during each iteration. The return value of the block is the evaluated result of the last line executed, which is placed into a new collection. When the `map` method has completed iterating, the new collection is returned.

------------------------------------

### 5

What does the following code return? What does it output? Why? What concept does it demonstrate?

