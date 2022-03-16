module PerfectNumber
  def self.classify(number)
    raise ArgumentError if number.class != Integer || number < 1
    case aliquot_number(number)
    when number then 'perfect'
    when (1...number) then 'deficient'
    else
      'abundant'
    end
  end

  class << self
    private

    def aliquot_number(number)
      divisors(number).sum
    end

    def divisors(number)
      result = [1]
      iterator = 1
      max_divisor = number
      while iterator < max_divisor
        iterator += 1
        max_divisor = number / iterator
        next unless number % iterator == 0
        result += [iterator, number / iterator]
      end
      result
    end
  end
end
