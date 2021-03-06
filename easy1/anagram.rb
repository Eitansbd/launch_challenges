=begin
Write a program that, given a word and a list of possible anagrams, selects the
correct sublist that contains the anagrams of the word.

For example, given the word "listen" and a list of candidates like "enlists"
"google" "inlets" "banana" the program should return a list containing "inlets".
Please read the test suite for exact rules of anagrams.
=end

# anagrams
  # every letter in word is used once and only once in the test word
  # it is not the word itself

require 'pry'
class Anagram
  def initialize(word)
    @original_word = word.downcase
    @sorted_letters = @original_word.chars.sort
  end

  def match(arr)
    arr.select do |anagram|
      next if anagram.downcase == @original_word
      anagram.downcase.chars.sort == @sorted_letters
    end
  end
end
