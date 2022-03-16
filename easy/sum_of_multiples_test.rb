=begin
Problem notes:

given a natural number, and a set of one or more other numbers
find the sum of all the multiples of the numbers in the set
that are less than the first number

if the set of numbers is not given use a default set of 3 and 5

Examples / Test cases:

20 (3, 5) => 3, 5, 6, 9, 10, 12, 15, 18 => 78

class SumOfMultiples => constructor takes set of numbers or uses default (3, 5)
  SumOfMultiples::to(num)
  SumOfMultiples#to(num)

Data strucutres:

use an array to collect multiples
constructor collects arguments into an array

Algorithim:

generate list of multiples up to limit
  (1...20).select { |i| set.any? { |x| (i % x).zero? } }
return sum of multiples
=end

require 'minitest/autorun'
require_relative 'sum_of_multiples'

class SumTest < Minitest::Test
  def test_sum_to_1
    assert_equal 0, SumOfMultiples.to(1)
  end

  def test_sum_to_3
    assert_equal 3, SumOfMultiples.to(4)
  end

  def test_sum_to_10
    assert_equal 23, SumOfMultiples.to(10)
  end

  def test_sum_to_100
    assert_equal 2_318, SumOfMultiples.to(100)
  end

  def test_sum_to_1000
    assert_equal 233_168, SumOfMultiples.to(1000)
  end

  def test_configurable_7_13_17_to_20
    assert_equal 51, SumOfMultiples.new(7, 13, 17).to(20)
  end

  def test_configurable_4_6_to_15
    assert_equal 30, SumOfMultiples.new(4, 6).to(15)
  end

  def test_configurable_5_6_8_to_150
    assert_equal 4419, SumOfMultiples.new(5, 6, 8).to(150)
  end

  def test_configurable_43_47_to_10000
    assert_equal 2_203_160, SumOfMultiples.new(43, 47).to(10_000)
  end
end
