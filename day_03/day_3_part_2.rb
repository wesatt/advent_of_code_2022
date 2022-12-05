require 'pry'

class RucksackChecker
  def initialize(list)
    @list = list
    @alphabet = [('a'..'z').to_a, ('A'..'Z').to_a].flatten
  end

  def shared_elements_priority
    shared = @list.map do |sack|
      rucksack_comparer(rucksack_splitter(sack))
    end.flatten
    shared.map { |l| @alphabet.index(l) + 1 }
  end

  def badge_priority_list
    shared = []
    @list.each_slice(3) do |three|
      arrs = three.map { |l| l.chars }
      shared << (arrs[0] & arrs[1] & arrs[2])
    end
    shared.flatten.map { |l| @alphabet.index(l) + 1 }
  end

  private

  def rucksack_splitter(full)
    characters = full.chars
    half_count = (characters.count / 2)
    characters.each_slice(half_count).to_a
  end

  def rucksack_comparer(arrays)
    arrays[0] & arrays[-1]
  end
end

group1 = 'vJrwpWtwJgWrhcsFMMfFFhFp
jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
PmmdzqPrVvPwwTWBwg'

group2 = 'wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
ttgJtRGJQctTZtZT
CrZsJsPPZsGzwwsLwLmpwMDw'

list1 = File.read("day_3_list.txt").split("\n")
group1_list = group1.split("\n")
group2_list = group2.split("\n")

first_list = RucksackChecker.new(list1)
second_list = RucksackChecker.new(group1_list)
third_list = RucksackChecker.new(group2_list)

puts first_list.shared_elements_priority.sum
puts second_list.shared_elements_priority.sum
puts ""
puts first_list.badge_priority_list.sum
puts second_list.badge_priority_list.sum
puts third_list.badge_priority_list.sum
