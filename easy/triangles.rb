class Triangle
  attr_accessor :a, :b, :c, :sides

  def initialize(side_a, side_b, side_c)
    self.a = side_a
    self.b = side_b
    self.c = side_c
    self.sides = [a, b, c]
    return if valid_triangle?
    raise ArgumentError
  end

  def kind
    case equal_side_pairs
    when 3 then 'equilateral'
    when 1 then 'isosceles'
    when 0 then 'scalene'
    end
  end

  def equal_side_pairs
    [a == b, b == c, a == c].count(true)
  end

  private

  def valid_triangle?
    [
      sides.all?(&:positive?),
      a + b > c,
      b + c > a,
      a + c > b
    ].all?
  end
end
