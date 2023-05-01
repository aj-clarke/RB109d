=begin
Question:
You live in the city of Cartesia where all roads are laid out in a perfect grid. You arrived ten minutes too early to an appointment, so you decided to take the opportunity to go for a short walk. The city provides its citizens with a Walk Generating App on their phones -- everytime you press the button it sends you an array of one-letter strings representing directions to walk (eg. ['n', 's', 'w', 'e']). You always walk only a single block in a direction and you know it takes you one minute to traverse one city block, so create a function that will return true if the walk the app gives you will take you exactly ten minutes (you don't want to be early or late!) and will, of course, return you to your starting point.
Return false otherwise.
Note: you will always receive a valid array containing a random assortment of direction letters ('n', 's', 'e', or 'w' only). It will never give you an empty array (that's not a walk, that's standing still!).

-----------------------
Rules:
  Explicit Requirements
  - Create a method that will return true if the input array will traverse you away and back to your location within "10 minutes"
  - Eeach "move" takes 1 minute


  Implicit Requirements
  - If array is not equal to 10 in size, return false

-----------------------
Modeling:
['n','n','n','s','n','s','n','s','n','s'] == false

Take input array and tally it { 'n' => 6, 's' => 4}

return false if `arr` is not equal to 10

If hash 'n' and hash 's' are equal && hash 'e' and hash 'w' are equal
return true
else
  false

-----------------------
Data Structure:
I: Array of directions to walk
W: Hash to count how many 'blocks' being walked in each direction
O: True or False depending on if you return back to your destination

Algorithm:
< given an array `arr` >

Return false if the input array is not equal to 10

Init `route` to `arr` converted into a direction/count hash

If hash 'n' and hash 's' are equal && hash 'e' and hash 'w' are equal
  Return true; otherwise, return false

-----------------------
Code:
=end

def is_valid_walk(arr)
  return false if !arr.size.eql?(10)

  route = arr.tally
  route['n'].eql?(route['s']) && route['e'].eql?(route['w']) ? true : false
end


p is_valid_walk(['n','s','n','s','n','s','n','s','n','s']) == true
p is_valid_walk(['w','e','w','e','w','e','w','e','w','e','w','e']) == false
p is_valid_walk(['w']) == false
p is_valid_walk(['n','n','n','s','n','s','n','s','n','s']) == false

# NICK
# def is_valid_walk(arr)
#   return false if arr.size != 10
#   north_south = 0
#   east_west = 0

#   arr.each do |direction|
#     case direction
#     when "n" then north_south += 1
#     when "s" then north_south -= 1
#     when "e" then east_west += 1
#     when "w" then east_west -= 1
#     end
#   end

#   north_south == 0 && east_west == 0
# end