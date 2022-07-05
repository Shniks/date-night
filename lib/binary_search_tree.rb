require_relative 'node'
require 'pry'

class BinarySearchTree

  attr_reader :head

  def initialize
    @head = nil
  end

  def insert_head_node(score, title, parent = nil)
    Node.new(score, title, head)
  end

end
