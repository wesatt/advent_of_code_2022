require 'pry'

class AssCheck
  def initialize(list)
    @list = list
  end

  def overclean_count
    counter = 0
    @list.each do |pair|
      split = splitter(pair)
      tof = dupes(split[0], split[-1])
      counter += 1 if tof
    end
    counter
  end

  def overlap_count
    counter = 0
    @list.each do |pair|
      split = splitter(pair)
      tof = overlaps(split[0], split[-1])
      counter += 1 if tof
    end
    counter
  end

  private

  def splitter(pair)
    duo = pair.split(',')
    first = duo[0].split("-")
    second = duo[-1].split("-")
    [first, second]
  end

  def dupes(first, second)
    first_range = (first[0]..first[-1]).to_a
    second_range = (second[0]..second[-1]).to_a
    shared = first_range & second_range
    (shared == first_range) || (shared == second_range)
  end

  def overlaps(first, second)
    first_range = (first[0]..first[-1]).to_a
    second_range = (second[0]..second[-1]).to_a
    shared = first_range & second_range
    !shared.empty?
  end
end

test_data = '2-4,6-8
2-3,4-5
5-7,7-9
2-8,3-7
6-6,4-6
2-6,4-8'

real_list = File.read('day_04_list.txt').split("\n")
test_list = test_data.split("\n")

testing = AssCheck.new(test_list)
for_real = AssCheck.new(real_list)

puts testing.overclean_count
puts ""
puts for_real.overclean_count
puts ""
puts for_real.overlap_count
