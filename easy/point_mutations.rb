class DNA
  attr_reader :strand

  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(string)
    smallest_length = [strand.size, string.size].min
    differences = 0
    smallest_length.times do |index|
      differences += 1 if strand[index] != string[index]
    end
    differences
  end
end
