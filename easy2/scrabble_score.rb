# scrabble_score.rb
# Write a program that, given a word, computes the scrabble score for that word.

# argument - string
# return - scrabble score
# rules:
  # white spaces, nil, should have score of 0
  # score is case insensitive

# algorithm
# Create hash mapping letter to score
# init sum = 0
# scan word for letters -
  # add letter score to sum
# return sum

class Scrabble
  LETTER_SCORE = {
    1 => %w(a e i o u l n r s t),
    2 => %w(d g),
    3 => %w(c b m p),
    4 => %w(f h v w y),
    5 => ['k'],
    8 => %w(j x),
    10 => %w(q z)
  }
  def initialize(word)
    @word = word
  end

  def score
    self.class.score(@word)
  end

  def self.score(word)
    return 0 unless word.is_a? String

    sum = 0
    word.scan(/[a-z]/i) do |letter|
      LETTER_SCORE.each do |score_val, set|
        break sum += score_val if set.include? letter.downcase
      end
    end
    sum
  end
end

p Scrabble.new('OXYPHENBUTAZONE').score
p Scrabble.score('alacrity')
p Scrabble.score(nil)
p Scrabble.new(" \t\n").score
p Scrabble.new('').score