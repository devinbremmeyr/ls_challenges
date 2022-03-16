class Diamond
  def self.make_diamond(letter)
    max_width = row_width(letter)

    letters = ('A'...letter).to_a
    letters += [letter] + letters.reverse

    letters.map! do |character|
      row(character).center(max_width)
    end
    letters.join("\n") + "\n"
  end

  class << self
    private

    def row_width(letter)
      index = letter.ord - 'A'.ord
      index * 2 + 1
    end

    def row(letter)
      return 'A' if letter == 'A'
      internal_spaces = ' ' * (row_width(letter) - 2)
      letter + internal_spaces + letter
    end
  end
end

puts Diamond.make_diamond('K') if __FILE__ == $PROGRAM_NAME
