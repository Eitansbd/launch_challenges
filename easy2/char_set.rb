=begin
have set of chars with letters, space, period.
word: 1-20 letters, seperated by 1 or more spaces.
last period might not be connected to the last word.

examples:
"whats the matter with kansas." =>
"whats eht matter htiw kansas"

"    whats   the   matter  with    kansas" =>
"whats eht matter htiw kansas"

"whats the matter with kansas ." =>
"whats eht matter htiw kansas"
=end

# argument - string
# output -
  # word only separated by 1 space
  # leading and trailing whitespace removed
  # period connected to last word

# algorithm
# split the string by spaces into an array
# check if the last element is just a period
  # if it is, removed it and append it to the last element
# map odd indexed numbers to the reverse, even to the same
# join the characters with a spaces.

def format_string(str)
  words = str.strip.split(/[^a-z]+/i)

  words.map!.with_index do |word, index|
    index.odd? ? word.reverse : word
  end

  words.join(' ') + '.'
end


p format_string("    whats   the   matter  with  the  kansas.")
p format_string("whats the matter with kansas   .")
p format_string(" whats the matter    with kansas.....")