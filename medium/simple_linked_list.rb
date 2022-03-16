class Element
  attr_reader :datum, :next

  def initialize(datum, next_element=nil)
    @datum = datum
    @next = next_element
  end

  def tail?
    @next.nil?
  end
end

class SimpleLinkedList
  def self.from_a(array)
    array = [] if array.nil?

    list = SimpleLinkedList.new
    array.reverse_each { |item| list.push(item) }
    list
  end

  attr_reader :head

  def initialize
    @head = nil
  end

  def reverse
    r_list = SimpleLinkedList.new
    each { |element| r_list.push(element.datum) }
    r_list
  end

  def size
    count = 0
    each { count += 1 }
    count
  end

  def empty?
    head.nil?
  end

  def peek
    return nil if empty?
    head.datum
  end

  def push(datum)
    @head = Element.new(datum, head)
  end

  def pop
    datum = peek
    @head = head.next
    datum
  end

  def to_a
    array = []
    each { |element| array << element.datum }
    array
  end

  def each
    element = head
    while element
      yield element
      element = element.next
    end
    self
  end
end
