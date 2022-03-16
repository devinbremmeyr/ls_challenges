class RomanNumeral
  DIGIT = 'MCXI'
  FIVE = ' DLV'

  def initialize(number)
    @number = number
    raise ArgumentError if @number > 3_999
  end

  def to_roman
    four_digit_array
      .map.with_index do |digit, index|
        numeral(digit, index)
      end
      .join
  end

  private

  def numeral(digit, i)
    if digit == 4
      DIGIT[i] + FIVE[i]
    elsif digit == 9
      DIGIT[i] + DIGIT[i - 1]
    else
      FIVE[i] * (digit / 5) + DIGIT[i] * (digit % 5)
    end
  end

  def four_digit_array
    format('%4d', @number).chars.map(&:to_i)
  end
end
