class Octal
  def initialize(octal_string)
    @octal_string = octal_string
  end

  def to_decimal
    return 0 if invalid_octal?
    @octal_string.reverse.chars.map.with_index do |char, i|
      char.to_i * 8.pow(i)
    end.sum
  end

  private

  def invalid_octal?
    @octal_string.match?(/[^0-7]/)
  end
end
