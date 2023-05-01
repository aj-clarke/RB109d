=begin
Question:
Took 24:40 mins
Help the frog to find a way to freedom
You have an array of integers and have a frog at the first position

[Frog, int, int, int, ..., int]

The integer itself will tell you the length and the direction of the jump

For instance:
 2 = jump two indices to the right
-3 = jump three indices to the left
 0 = stay at the same position
Your objective is to find how many jumps are needed to jump out of the array.

Return -1 if Frog can't jump out of the array

-----------------------
Rules:
  Explicit Requirements
  - Find how many 'jumps' are required to get out of the array (going right)
  - You are jumping to INDICIES (INDEXES)
  - Integer tells you how many jumps to the right (if positive) or left (if neg) you move
  - Return -1 if you cannot jump out

  Implicit Requirements

-----------------------
Examples:
array = [1, 2, 1, 5]; 
jumps = 3  (1 -> 2 -> 5 -> <jump out>)

-----------------------
Modeling:
[1, 2, 2, -1] == 4

`arr` => [1, 2, 2, -1]

Init `current_idx` = 0 # Loop1 [1] Loop2 [3]
Init `idx_tracker` to an empy collection # Loop1 [0] Loop2 [1]
Init `jumps` = 0 #Loop1 [1] Loop2 

START A LOOP
  Push `current_idx` into `idx_tracker` 
  Init `move` to `arr` at index position `current_index` # Loop1 [1] Loop2 [2]
  Reassign `current_idx` to `current_idx` + `move` # Loop1 [1] Loop2 [3]
  Increment `jumps` by 1 # Loop1 [1] Loop2 [2]
  Break out of loop if `current_idx` > `arr`'s size - 1 || if `idx_tracker` includes `current_idx`

If `current_idx` > `arr`'s size - 1, return `jumps` : if not, return -1

-----------------------

Data Structure:
I: Array of integers
W: Looping through array based on reqs
O: Num of jumps or -1 depending on results

Algorithm:
< given an array `arr` >
-----------------------
Code:
=end

def solution(arr)
  current_idx = 0
  idx_tracker = []
  jumps = 0

  return 1 if arr[current_idx] < 0

  loop do
    idx_tracker << current_idx
    move = arr[current_idx]
    current_idx += move
    jumps += 1
    break if current_idx > (arr.size - 1) || current_idx < 0 || idx_tracker.include?(current_idx)
  end

  current_idx > (arr.size - 1) || current_idx < 0 ? jumps : -1
end

p solution([1, 2, 2, -1]) == 4
p solution([1, 2, 1, 5]) == 3
p solution([1, -1]) == -1
