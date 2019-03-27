=begin
Write a program that, given a number, can find the sum of all the multiples
of particular numbers up to but not including that number.

If we list all the natural numbers up to but not including 20 that are multiples
of either 3 or 5, we get 3, 5, 6, 9, 10, 12, 15, and 18. The sum of these
multiples is 78.

Write a program that can find the sum of the multiples of a given set of numbers.
If no set of numbers is given, default to 3 and 5.
=end

# input - set of numbers, max
# output - sum of all the multiples of the numbers in the set up to the max

require 'pry'
class SumOfMultiples
  attr_reader :set
  def initialize(*set)
    @set = set
  end

  def to(max_number)
    self.class.to(set, max_number)
  end

   def self.to(set = [3,5], max_number)
    set.map { |num| sum_multiples(num, max_number) }.flatten.uniq.sum
  end

  def self.sum_multiples(num, max)
    multiples = []
    multiplier = 1
    loop do
      current_multiple = num * multiplier
      break if current_multiple >= max
      multiples << current_multiple
      multiplier += 1
    end
    multiples
  end
end

SumOfMultiples.to(10)


