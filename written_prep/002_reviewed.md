# What does the following code return? What does it output? Why? What concept does it demonstrate?

arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.map do |n|
  n > 1
end

p new_array
=begin
The above code will return and also output `[false, true, true, true, true, true, true, true, true, true]`. On `line 3`, local variable `arr` is initialized to the array object `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`. On `line 5` we initialize local variable `new_array` to the return value of the invocation of `map` on `arr`. The `do..end` on `lines 5 to 7` define the `map` block with one block parameter of `n`.

On each iteration, each element from `arr` is passed into the block to bind to parameter `n`, creating a local block variable. Within the block, the expression `n > 1` is evaluated, and the block will return a boolean `true` or `false` as a result. The `map` method will store the return value of each iteration in a new array object. When iteration is complete, the new array object is returned from the method and assigned to local variable `new_array`.

On `line 9` we invoke the `p` method and pass in `new_array` as an argument. The `p` method outputs the `new_array` array object, and always returns its caller.
This code shows the concept of iteration using the `map` method, how it returns the last evaluated expression each block iteration, and how it returns a new array containing the block values from each iteration.
=end