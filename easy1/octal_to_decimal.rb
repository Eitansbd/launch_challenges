# Implement octal to decimal conversion. Given an octal input string, your
# program should produce a decimal output.

# input - octal number as string!
# output - decimal number

# exampes:

# 11 in octal --> 1 * 8 ** 0 + 1 * 8 ** 1 = 9 in decimal

# data - split string into an array, then map each number to its decimal number

# algorithm
# set octal_array = string.chars.reverse
# decimal array = octal_array transformation
  # transofrm by num * (8 ** index)

# sum the decimal array

class Octal
  def initialize(string_num)
    @reverse_octal_arr = string_num.to_i.digits
  end

  def to_decimal
    return 0 if invalid_argument

    decimal_arr = @reverse_octal_arr.map.with_index do |digit, index|
      digit * (8 ** index)
    end

    decimal_arr.sum
  end

  def invalid_argument
    @reverse_octal_arr.any? do |digit|
      !(0..7).cover? digit
    end
  end
end

num = Octal.new('11')
puts num.to_decimal