require_relative './node'

class LinkedList
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

  def to_s
    current = @head
    loop do
      puts current
      break if current.next_node.nil?

      current = current.next_node
    end
  end
end

list = LinkedList.new
list.append('A')
list.append('B')
list.append('C')
list.prepend('0')
list.append('D')
list.prepend('pre')
puts list
