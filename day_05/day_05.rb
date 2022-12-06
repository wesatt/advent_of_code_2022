require 'pry'

def move_crates(input)
  split = split_directions(input)
  layout_start = split[0]
  directions_final = split[1]

  directions_final.each do |direction|
    move = direction[0]
    from = direction[1]
    to = direction[2]
    move.to_i.times do
      crate = layout_start[from].pop
      layout_start[to] << crate
    end
  end

  layout_start
end

def move_crates_together(input)
  split = split_directions(input)
  layout_start = split[0]
  directions_final = split[1]

  directions_final.each do |direction|
    move = direction[0]
    from = direction[1]
    to = direction[2]
    crates = layout_start[from].pop(move.to_i)
    layout_start[to] << crates
    layout_start[to].flatten!
  end

  layout_start
end


def top_crates(input)
  input.map do |k, v|
    v.pop.gsub!(/[^A-Z]/,'')
  end.flatten.join
end

def split_directions(input)
  split_up = input.split("\n\n")
  layout = split_up[0]
  directions = split_up[1]
  [layout_setup(layout), directions_setup(directions)]
end

def layout_setup(input)
  layout_arrays = input.split("\n").map do |e|
    e.chars.each_slice(4).map do |s|
      s.join.delete(' ')
    end
  end

  column_hash = {}

  layout_arrays[-1].each do |column|
    column_hash[column] = []
  end

  layout_arrays[0..-2].each do |crates|
    crates.each_with_index do |crate, index|
      column_hash[(index + 1).to_s] << crate
    end
  end

  column_hash.each do |key, value|
    value.reverse!
    value.delete("")
  end

  column_hash
end

def directions_setup(input)
  nums_and_spaces = input.gsub(/[^0-9 \n]/,'').split("\n")
  nums_and_spaces.map do |set|
    set.split(' ')
  end
end

test_input = '    [D]
[N] [C]
[Z] [M] [P]
 1   2   3

move 1 from 2 to 1
move 3 from 1 to 3
move 2 from 2 to 1
move 1 from 1 to 2'

real_data = File.read('day_05_input.txt')

testing = move_crates(test_input)
puts top_crates(testing)
puts""
actual = move_crates(real_data)
puts top_crates(actual)
puts ""
part2 = move_crates_together(real_data)
puts top_crates(part2)
