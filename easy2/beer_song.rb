# beer_song.rb
# Write a program that can generate the lyrics of the 99 Bottles of Beer song.
# See the test suite for the entire song.

class BeerSong
  def verse(vrs)
    words(vrs)
  end

  def verses(first_verse, last_verse)
    first_verse.downto(last_verse).map do |verse_num|
      words(verse_num)
    end.join("\n")
  end

  def words(verse_num)
    case verse_num
    when (3..99) then standard_words(verse_num)
    when 2       then two_left_words
    when 1       then one_left_words
    when 0       then last_verse_words
    end
  end

  def standard_words(verse_num)
   "#{verse_num} bottles of beer on the wall, #{verse_num} bottles of beer.\n" \
      "Take one down and pass it around, #{verse_num - 1} bottles of beer on the wall.\n"
  end

  def two_left_words
    "2 bottles of beer on the wall, 2 bottles of beer.\n" \
      "Take one down and pass it around, 1 bottle of beer on the wall.\n"
  end
  
  def one_left_words
    "1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
  end

  def last_verse_words
    "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
  end

  def lyrics
    verses(99, 0)
  end
end
