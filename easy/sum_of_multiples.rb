class SumOfMultiples
  attr_reader :set

  def initialize(*set)
    @set = set
    @set = [3, 5] if @set.empty?
  end

  def self.to(multiples_limit)
    new.to(multiples_limit)
  end

  def to(limit)
    multiples(limit).sum
  end

  private

  def multiples(limit)
    (1...limit).select do |i|
      set.any? { |x| (i % x).zero? }
    end
  end
end
