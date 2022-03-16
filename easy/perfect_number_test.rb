=begin
Problem notes:

classifiacation for natural numbers (1, 2, 3, ...)
abundant
perfect
deficient

comparison between the number and the sum of its positive divisors
this sum is known as the Aliquot sum

Perfect number: aliquot score == original number
Aubndant number: aliquot score > original number
Deficient number: aliquot score < origninal number


Examples/test cases:

6 divisors: 1 2 3 => 6 perfect
28 divisors: 1 2 4 7 14 => 28 perfect
15 divisors: 1 3 5 => 9 deficient
24 divisors: 1 2 3 4 8 6 12 => 36 abundant
12 divisors: 1 2 3 4 6 => 16 abundant

PRIME NUMBERS (7 13 etc) are ALWAYS deficient (only divisor is 1)

class PerfectNumber::classify returns string 'perfect'
classify raises some type of StandardError given a non-natural number

Data structures:

take a number as integer, return a string
might use a collection when determining divisors

Algorithm:

accept number as argument
raise exception if argument is not a natural number

return string depending on aliquot number comparison to number

aliquit number: sum divisors

divisors: 
starting from 1 iterate up to num / 2
if current_number % num == 0
  add to divisors array
  also add num / current_number


=end

require 'minitest/reporters'
require 'minitest/autorun'
MiniTest::Reporters.use!

require_relative 'perfect_numbers'

class PerfectNumberTest < Minitest::Test
  def test_initialize_perfect_number
    assert_raises StandardError do
      PerfectNumber.classify(-1)
    end
  end

  def test_classify_deficient
    assert_equal 'deficient', PerfectNumber.classify(13)
  end

  def test_classify_perfect
    assert_equal 'perfect', PerfectNumber.classify(28)
  end

  def test_classify_abundant
    assert_equal 'abundant', PerfectNumber.classify(12)
  end
end
