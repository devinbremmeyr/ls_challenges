class Anagram
  def initialize(word)
    @word = word
  end

  def match(word_list)
    compare = letter_counts(@word)
    word_list.select do |word|
      next if @word.downcase == word.downcase
      compare == letter_counts(word)
    end
  end

  private

  def letter_counts(word)
    counts = {}
    word.downcase.each_char do |letter|
      if counts.key?(letter)
        counts[letter] += 1
      else
        counts[letter] = 1
      end
    end
    counts
  end
end
