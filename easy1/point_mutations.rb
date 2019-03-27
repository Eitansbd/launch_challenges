class DNA

  attr_reader :strand1
  def initialize(strand1)
    @strand1 = strand1.chars
  end

  def hamming_distance(strand2)
    zipped_strands = strand1.zip(strand2.chars)
    zipped_strands.count {|set| set.first != set.last}
  end
end

p DNA.new('ABCD').hamming_distance("ABDC")
