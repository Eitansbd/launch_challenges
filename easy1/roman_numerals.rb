=begin
The Romans were a clever bunch. They conquered most of Europe and ruled it for
hundreds of years. They invented concrete and straight roads and even bikinis.
One thing they never discovered though was the number zero. This made writing
and dating extensive histories of their exploits slightly more challenging, but
the system of numbers they came up with is still in use today. For example the
BBC uses Roman numerals to date their programmes.

The Romans wrote numbers using letters - I, V, X, L, C, D, M. (notice these
letters have lots of straight lines and are hence easy to hack into stone
tablets).

 1  => I
10  => X
 7  => VII
There is no need to be able to convert numbers larger than about 3000.
(The Romans themselves didn't tend to go any higher)

Wikipedia says: Modern Roman numerals ... are written by expressing each digit
separately starting with the left most digit and skipping any digit with a value
of zero.
=end


# argument - integer
# return string of roman numeral

# 1-3 - add I's
# 5-8 - 5 + 8
# 10 - 30 - add X's



class Integer
  ROMAN_NUMERAL_RULES = {
   "M" => 1000,
   "CM" => 900,
   "D" => 500,
   "CD" => 400,
   "C" => 100,
   "XC" => 90,
   "L" => 50,
   "XL" => 40,
   "X" => 10,
   "IX" => 9,
   "V" => 5,
   "IV" => 4,
   "I" => 1
  }

 def to_roman
   roman_numeral_string = ""
   number = self
   ROMAN_NUMERAL_RULES.each do |roman_num_letter, value|
     times_letter_appear, number = number.divmod(value)
     roman_numeral_string += roman_num_letter * times_letter_appear
   end

   roman_numeral_string
 end
end

