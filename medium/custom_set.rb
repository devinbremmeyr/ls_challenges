class CustomSet
  def initialize(array=[])
    @elements = {}
    array.each { |item| @elements[item] = nil }
  end

  def empty?
    elements.empty?
  end

  def contains?(number)
    elements.key?(number)
  end

  def subset?(other_custom_set)
    elements.all? do |element, _|
      other_custom_set.contains?(element)
    end
  end

  def disjoint?(other_custom_set)
    elements.none? do |element, _|
      other_custom_set.contains?(element)
    end
  end

  def eql?(other_custom_set)
    return false unless other_custom_set.class == CustomSet
    elements.eql?(other_custom_set.elements)
  end

  alias == eql?

  def add(number)
    elements[number] = nil
    self
  end

  def intersection(other_custom_set)
    intersection_set = CustomSet.new
    each do |element|
      intersection_set.add(element) if other_custom_set.contains?(element)
    end
    intersection_set
  end

  def difference(other_custom_set)
    different_set = CustomSet.new
    each do |element|
      different_set.add(element) unless other_custom_set.contains?(element)
    end
    different_set
  end

  def union(other_custom_set)
    union_set = other_custom_set.clone
    each do |element|
      union_set.add(element)
    end
    union_set
  end

  protected

  def each
    elements.each { |element, _| yield(element) }
    self
  end

  attr_reader :elements
end
