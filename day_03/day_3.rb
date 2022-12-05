require 'pry'

x = 'vJrwpWtwJgWrhcsFMMfFFhFp
jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
PmmdzqPrVvPwwTWBwg
wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
ttgJtRGJQctTZtZT
CrZsJsPPZsGzwwsLwLmpwMDw'

list1 = File.read("day_3_list.txt").split("\n")
list2 = x.split("\n")

class RucksackChecker
  def initialize(list)
    @list = list
  end

  def shared_elements_priority
    shared = @list.map do |sack|
      rucksack_comparer(rucksack_splitter(sack))
    end.flatten
    alphabet = [('a'..'z').to_a, ('A'..'Z').to_a].flatten
    shared.map { |l| alphabet.index(l) + 1 }
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

first_list = RucksackChecker.new(list1)
second_list = RucksackChecker.new(list2)

puts first_list.shared_elements_priority.sum
puts second_list.shared_elements_priority.sum
