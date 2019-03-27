class Trinary
  def initialize(num)
    @digits = num.to_i.digits
  end

  def to_decimal
    valid_input? ? convert_num : 0
  end

  def convert_num
    @digits.map.with_index { |digit, index| digit * 3 ** index }.sum
  end

  def valid_input?
    @digits.all? { |digit| (0..2).cover? digit }
  end
end
