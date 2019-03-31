=begin
Pig Latin is a made-up children's language that's intended to be confusing. It
obeys a few simple rules (below), but when it's spoken quickly it's really
difficult for non-children (and non-native speakers) to understand.

Rule 1: If a word begins with a vowel sound, add an "ay" sound to the end of
the word.
Rule 2: If a word begins with a consonant sound, move it to the end of the word,
and then add an "ay" sound to the end of the word.
There are a few more rules for edge cases, and there are regional variants too.
=end


class PigLatin
  def self.translate(string)
    string.split.map { |word| convert(word) }.join(' ')
  end

  def self.convert(word)
    if begin_with_vowel?(word) || begin_with_yx_then_cons?(word)
      word + 'ay'
    elsif has_qu?(word)
      leading_cons_with_u, remaining_word = parse_for_lead_qu(word)
      remaining_word + leading_cons_with_u + 'ay'
    else
      leading_consonant, remaining_word = parse_for_lead_cons(word)
      remaining_word + leading_consonant + 'ay'
    end
  end

  def self.begin_with_vowel?(word)
    word.match(/^[aeiou]/)
  end

  def self.begin_with_yx_then_cons?(word)
    word.match(/^[xy][^aeiou]/)
  end

  def self.has_qu?(word)
    word.match(/^[^aeuio]?qu/)
  end

  def self.parse_for_lead_qu(word)
    first_u_index = word.index(/u/)
    return word[0..first_u_index], word[(first_u_index + 1)..-1]
  end

  def self.parse_for_lead_cons(word)
    first_vowel_index = word.index(/[aeiou]/)
    return word[0..(first_vowel_index - 1)], word[(first_vowel_index)..-1]
  end
end
