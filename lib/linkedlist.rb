require_relative './node'

class LinkedList
  attr_reader :head

  def initialize
    @head = Node.new
  end

  def append(value)
    current = @head
    loop do
      if @head.value.nil?
        @head.value = value
        break
      end
      if current.next_node.nil?
        current.next_node = Node.new(value)
        break
      end
      current = current.next_node
    end
  end

  def prepend(value)
    new_head = Node.new(value, @head)
    @head = new_head
  end

  def size
    nodes = @head.value.nil? ? 0 : 1
    current = @head
    loop do
      break if current.next_node.nil?

      current = current.next_node
      nodes += 1
    end
    nodes
  end

  def tail
    current = @head
    loop do
      break if current.next_node.nil?

      current = current.next_node
    end
    current
  end

  def at(index)
    current = @head
    i = 0
    loop do
      break if i == index

      current = current.next_node
      i += 1
    end
    current
  end

  def pop
    last = tail
    new_last = at(size - 2)
    new_last.next_node = nil
    last
  end

  def contains?(value)
    current = @head
    loop do
      return true if current.value == value
      break if current.next_node.nil?

      current = current.next_node
    end
    false
  end

  def find(value)
    index = 0
    current = @head
    loop do
      break if current.value == value
      return nil if current.next_node.nil?

      current = current.next_node
      index += 1
    end
    index
  end

  def insert_at(value, index)
    current_at_index = at(index)
    new_node = Node.new(value, current_at_index)
    previous = at(index - 1)
    previous.next_node = new_node
  end

  def remove_at(index)
    previous = at(index - 1)
    previous.next_node = at(index + 1)
  end

  def to_s
    current = @head
    str = ''
    loop do
      str += "(#{current.value}) -> "
      if current.next_node.nil?
        str += "nil\n"
        break
      end

      current = current.next_node
    end
    str
  end
end

list = LinkedList.new
list.append('A')
list.append('B')
list.append('C')
list.prepend('0')
list.append('D')
list.prepend('pre')
puts list.size
puts list.head
puts list.tail
puts list.at(3)
puts '-----'
puts list
puts '-----'
puts list.pop
puts '-----'
puts list
puts '-----'
puts list.contains?('Z')
puts list.contains?('A')
puts list.find('Z')
puts list.find('A')
puts '-----'
list.insert_at('inserted', 3)
puts list
puts '-----'
list.remove_at(4)
puts list
