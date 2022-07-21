require_relative './node'

class LinkedList
  include Enumerable
  attr_reader :head

  def initialize(value)
    @head = Node.new(value)
  end

  def each
    current = @head
    loop do
      yield(current)
      break if current.next_node.nil?

      current = current.next_node
    end
    self
  end

  def append(value)
    insert_at(value, size)
  end

  def prepend(value)
    insert_at(value, 0)
  end

  def size
    count
  end

  def tail
    each { |node| return node if node.next_node.nil? }
  end

  def at(index)
    each_with_index { |node, i| return node if i == index }
  end

  def pop
    remove_at(size - 1)
  end

  def contains?(value)
    any? { |node| node.value == value }
  end

  def find(value)
    find_index { |node| node.value == value }
  end

  def insert_at(value, index)
    raise IndexError if index.negative? || index > size

    case index
    when 0
      @head = Node.new(value, head)
    when size
      (tail).next_node = Node.new(value)
    else
      (at(index - 1)).next_node = Node.new(value, at(index))
    end
    self
  end

  def remove_at(index)
    raise IndexError if index.negative? || index >= size || index.zero? && size == 1

    removed = at(index)
    case index
    when 0
      @head = at(1)
    else
      (at(index - 1)).next_node = index == size - 1 ? nil : at(index + 1)
    end
    removed
  end

  def to_s
    str = ''
    each do |node|
      str += "#{node} -> "
      str += "nil\n" if node.next_node.nil?
    end
    str
  end
end

list = LinkedList.new('init')
list.append('7')
list.append('C')
list.append('J')
puts "List: \n#{list}"
puts "Size: #{list.size}"
puts "Head: #{list.head}"
puts "Tail: #{list.tail}"
puts "At idx 2: #{list.at(2)}"
puts "Inserting B at index 2: #{list.insert_at('B', 2)}"
puts "Called pop: #{list.pop}"
puts "List: #{list}"
