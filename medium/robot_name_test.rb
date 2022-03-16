=begin
problem notes:

manage robot factory settings
when robot comes from factory it has no name
when booted up a random name is generated

RX837
BC811

when a robot is reset to factory settings it's name is wiped
next time it is asked for name, a new name is generated

The names must be random, they should not follow a predictable sequence
Random names means there is a risk of collisions
  Do not allow using the same name twice when avoidable

Examples test cases:

class Robot, Robot#name returns name, Robot#reset creates a new name

name has strucutre [letter][letter][number][number][number]

All robots need to avoid reusing names

Data structures:

store used names in a collection

name is a string
Algorithms:

store used names as a class variable

=end

require 'minitest/autorun'
require_relative 'robot_name'

class RobotTest < Minitest::Test
  DIFFERENT_ROBOT_NAME_SEED = 1234
  SAME_INITIAL_ROBOT_NAME_SEED = 1000

  NAME_REGEXP = /^[A-Z]{2}\d{3}$/

  def test_has_name
    assert_match NAME_REGEXP, Robot.new.name
  end

  def test_name_sticks
    robot = Robot.new
    robot.name
    assert_equal robot.name, robot.name
  end

  def test_different_robots_have_different_names
    Kernel.srand DIFFERENT_ROBOT_NAME_SEED
    refute_equal Robot.new.name, Robot.new.name
  end

  def test_reset_name
    Kernel.srand DIFFERENT_ROBOT_NAME_SEED
    robot = Robot.new
    name = robot.name
    robot.reset
    name2 = robot.name
    refute_equal name, name2
    assert_match NAME_REGEXP, name2
  end

  def test_different_name_when_chosen_name_is_taken
    Kernel.srand SAME_INITIAL_ROBOT_NAME_SEED
    name1 = Robot.new.name
    Kernel.srand SAME_INITIAL_ROBOT_NAME_SEED
    name2 = Robot.new.name
    refute_equal name1, name2
  end
end
