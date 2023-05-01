# https://fine-ocean-68c.notion.site/Code-Wars-Problem-Set-b1b328603eea4cfb9d9dbf39b0033d67

=begin
Question:
Pete, the baker

5 kyu
Pete likes to bake some cakes. He has some recipes and ingredients. Unfortunately he is not good in maths. Can you help him to find out, how many cakes he could bake considering his recipes?
Write a function cakes(), which takes the recipe (object) and the available ingredients (also an object) and returns the maximum number of cakes Pete can bake (integer). For simplicity there are no units for the amounts (e.g. 1 lb of flour or 200 g of sugar are simply 1 or 200). Ingredients that are not present in the objects, can be considered as 0.
Examples:
// must return 2
cakes({flour: 500, sugar: 200, eggs: 1}, {flour: 1200, sugar: 1200, eggs: 5, milk: 200});
// must return 0
cakes({apples: 3, flour: 300, sugar: 150, milk: 100, oil: 100}, {sugar: 500, flour: 2000, milk: 2000});
-----------------------
Questions:
Rules:
  Explicit Requirements
  - Using available ingredients, make as many 'cakes' as possible depending on recipie requirements
  - Ingredients not present = 0
  Implicit Requirements

I: Hash
O: Integer


-----------------------
Examples:
// must return 2
cakes({flour: 500, sugar: 200, eggs: 1}, {flour: 1200, sugar: 1200, eggs: 5, milk: 200});
// must return 0
cakes({apples: 3, flour: 300, sugar: 150, milk: 100, oil: 100}, {sugar: 500, flour: 2000, milk: 2000});

-----------------------
Modeling:
// must return 2
create result empty array
cakes({flour: 500, sugar: 200, eggs: 1} = `ingredients`
{flour: 1200, sugar: 1200, eggs: 5, milk: 200}); = `stock`

If all required ingredients are not in stock, return 0

Go through each stock item, and divide the keys value from `stock` by the keys value in ingredients if the key is in `ingredients`
Store the result of the above in an array (push into `result`)
=> [2, 6, 5] == flour, sugar, eggs

Return the minimum value from the array

-----------------------
Data Structure:
I: Hash of all ingredients, and hash of all items available
W: Using hash, and an array to determine how many cakes i 'could' make with the available stock
O: Integer (Max number of cakes that can be made)

Algorithm:
< given 2 hashes `ingredients`, `stock` >

Init `result` to an empty collection

Iterate through ingredients to check if 'all?' ingredients are in `stock`

Go through each stock item, and divide the keys value from `stock` by the keys value in ingredients if the key is in `ingredients`, and push result into `result`

Return the min value from the array


-----------------------
Code:
=end

def cakes(ingredients, stock)
  result = []

  return 0 if !ingredients.all? { |ing,_| stock[ing]}

  stock.each do |ing, value|
    result << value / ingredients[ing] if ingredients[ing]
  end
  result.min
end

p cakes({"flour"=>500, "sugar"=>200, "eggs"=>1},{"flour"=>1200, "sugar"=>1200, "eggs"=>5, "milk"=>200}) == 2
p cakes({"cream"=>200, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>1700, "flour"=>20000, "milk"=>20000, "oil"=>30000, "cream"=>5000}) == 11
p cakes({"apples"=>3, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>500, "flour"=>2000, "milk"=>2000}) == 0
p cakes({"apples"=>3, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>500, "flour"=>2000, "milk"=>2000, "apples"=>15, "oil"=>20}) == 0
p cakes({"eggs"=>4, "flour"=>400},{}) == 0
p cakes({"cream"=>1, "flour"=>3, "sugar"=>1, "milk"=>1, "oil"=>1, "eggs"=>1},{"sugar"=>1, "eggs"=>1, "flour"=>3, "cream"=>1, "oil"=>1, "milk"=>1}) == 1