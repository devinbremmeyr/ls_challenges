class Robot
  attr_reader :name

  @@used_names = []
  ALPHABET = ('A'..'Z').to_a

  def initialize
    reset
  end

  def reset
    letter1 = ALPHABET[rand(27)]
    letter2 = ALPHABET[rand(27)]
    number = format('%03d', rand(1_000))
    @name = "#{letter1}#{letter2}#{number}"
    reset if @@used_names.include?(name)
    @@used_names << name
  end
end
