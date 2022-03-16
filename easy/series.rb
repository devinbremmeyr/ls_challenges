class Series
  attr_reader :digits

  def initialize(digits)
    @digits = digits
  end

  def slices(series_length)
    raise ArgumentError if series_length > digits.length
    digits.chars.map(&:to_i).each_cons(series_length).to_a
  end
end
