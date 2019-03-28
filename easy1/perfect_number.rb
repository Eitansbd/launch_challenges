=begin
The Greek mathematician Nicomachus devised a classification scheme for natural
numbers, identifying each as belonging uniquely to the categories of abundant,
perfect, or deficient. A perfect number equals the sum of its positive divisors
— the pairs of numbers whose product yields the target number, excluding the
number itself. This sum is known as the Aliquot sum.

Perfect: Sum of factors = number
Abundant: Sum of factors > number
Deficient: Sum of factors < number
Examples:

6 is a perfect number because its divisors are 1, 2, 3 and 6 = 1 + 2 + 3.
28 is a perfect number because 28 = 1 + 2 + 4 + 7 + 14.
Prime numbers 7, 13, etc are deficient by the Nicomachus classification.
Write a program that can tell if a number is perfect, abundant or deficient
=end

# argument integer
# return string of 'perfect' 'abundant' or 'deficient'

# need all the multiples up to the number
# sum those multiples
# check if the sum if =, greater, or less than the number

class PerfectNumber
  def self.classify(num)
    raise RuntimeError if num < 0
    
    sum = sum_of_multiples(num)
    case
    when sum == num then 'perfect'
    when sum > num  then 'abundant'
    else                 'deficient'
    end
  end

  def self.sum_of_multiples(num)
    sum = 0
    1.upto(num - 1) do |multiple|
      sum += multiple if (num % multiple) == 0
    end
    sum
  end
end



