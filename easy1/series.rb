# Write a program that will take a string of digits and give you all the possible consecutive number series of length n in that string.

# For example, the string "01234" has the following 3-digit series:

# - 012
# - 123
# - 234
# And the following 4-digit series:

# - 0123
# - 1234
# And if you ask for a 6-digit series from a 5-digit string, you deserve whatever you get.


class Series
  def initialize(string_digits)
    @digits = string_digits.each_char.map(&:to_i)
  end

  def slices(cons)
    raise ArgumentError, "Consecutive is larger than size" if cons > @digits.size

    0.upto(@digits.size - cons).map { |index|  @digits[index, cons] }
  end
end
