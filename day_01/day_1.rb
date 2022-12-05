require 'pry'

list = File.read("day_1_list.txt")

list_arr = list.split("\n")

total_arr = []

sum_arr = []

list_arr.each_with_index do |n, i|
  n = n.to_i
  if n > 0 && i != (list_arr.count - 1)
    sum_arr << n
  elsif i == (list_arr.count - 1)
    sum_arr << n
    total_arr << sum_arr.sum
    sum_arr.clear
  else
    total_arr << sum_arr.sum
    sum_arr.clear
  end
end

puts "the elf carrying the most calories is carrying:"
puts total_arr.max
puts ""
puts "The top three elves are carrying a total calorie count of:"
sorted_arr = total_arr.sort.reverse
top_three = sorted_arr[0] + sorted_arr[1] + sorted_arr[2]
puts top_three
