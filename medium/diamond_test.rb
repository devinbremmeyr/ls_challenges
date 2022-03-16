=begin
problem notes:
take a letter as initial input
OUTPUT a diamond shape

Diamond starts with 'A', the provided letter at the largest point
the first row is 'A'
the last row is 'A'

width of diamond = height
Examples:
class Diamond
  class method make_diamond returns string
    diamond rows seperated by newline characters

Main edge case 'A'
  Diamond for 'A' is just 'A'
  all other diamonds have a top and bottom 'A'

Data:
  strings, maybe use arrays to help

Algorithim:

each diamond row has the same width and ends with "\n"
(each letter row will always have the same internal spaces)
(external padding spaces change by diaond width)

A:
return "A\n" width 1

B:
generate 'A' row with width 3
concatenate 'A' row with 'B B\n'
end with final 'A' row

C:
generate 'A' row width 5
concatenate 'B' row one space
=> 'C' row with 3 spaces between
concatenate 'B' row
concatenate 'C' row

D:
'A' row width 7
'B' row
'C' row
'D' row internal spacing 5
=end
require 'minitest/autorun'
require_relative 'diamond'

class DiamondTest < Minitest::Test
  def test_letter_a
    answer = Diamond.make_diamond('A')
    assert_equal "A\n", answer
  end

  def test_letter_b
    answer = Diamond.make_diamond('B')
    assert_equal " A \nB B\n A \n", answer
  end

  def test_letter_c
    answer = Diamond.make_diamond('C')
    string = "  A  \n"\
             " B B \n"\
             "C   C\n"\
             " B B \n"\
             "  A  \n"
    assert_equal string, answer
  end

  def test_letter_e
    answer = Diamond.make_diamond('E')
    string = "    A    \n"\
             "   B B   \n"\
             "  C   C  \n"\
             " D     D \n"\
             "E       E\n"\
             " D     D \n"\
             "  C   C  \n"\
             "   B B   \n"\
             "    A    \n"
    assert_equal string, answer
  end
end
