# word_count.rb
=begin
Write a program that given a phrase can count the occurrences of each
word in that phrase.

For example, if we count the words for the input "olly olly in come free",
we should get:

olly: 2
in: 1
come: 1
free: 1
=end

class Phrase
  def initialize(string)
    @phrase = string
  end

  def word_count
    count = Hash.new(0)
    @phrase.scan(/\b[\w']+\b/) do |word|
      count[word.downcase] += 1
    end

    count
  end
end

