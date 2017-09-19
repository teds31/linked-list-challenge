require 'pry'
require_relative 'node'

class LinkedList
  def initialize
    @head = nil
  end

  def each
    node = @head

    while !node.nil?
      yield(node.data)
      node = node.next
    end
  end

  def prepend(value)
    @head = Node.new(value, @head)
  end

  def insert(index, value)
    i = index
    if index === 0
      prepend(value)
    else
      until i = 0
        i -= 1
      end
      prepend(value)
    end
  end

  def [](index)
    current_index = 0
    node = @head
    until current_index == index || node.nil?
      node = node.next_node
      current_index += 1
    end
    node
  end

  def remove(index)
   if index == 0
     @head = self[index].next_node
   else
     prev_node = self[index - 1]
     this_node = self[index]
     next_node = self[index + 1]
     prev_node.next_node = next_node
     this_node.next_node = nil
   end
 end

 def to_s
   
 end

  class Node
    attr_accessor :info, :next_node

    def initialize(info, next_node = nil)
      self.info = info
      self.next_node = next_node
    end
  end
end
