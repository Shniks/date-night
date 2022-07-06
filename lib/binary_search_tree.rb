require_relative 'node'
require 'csv'
require 'pry'

class BinarySearchTree

  attr_reader :head

  def initialize
    @head = nil
  end

  def insert(score, title, parent = nil)
    if head.nil?
      insert_head_node(score, title, parent)
      @depth = 0
    else
      current_node = head
      @depth = 0
      traverse_direction(score, title, current_node)
    end
  end

  def insert_head_node(score, title, parent = nil)
    @head = Node.new(score, title, head)
  end

  def traverse_direction(score, title, current_node)
    if score < current_node.score
      traverse_left(score, title, current_node)
    else
      traverse_right(score, title, current_node)
    end
  end

  def traverse_left(score, title, current_node)
    if current_node.node_left.nil?
      current_node.node_left = Node.new(score, title, current_node)
      @depth += 1
    else
      direction_of_node_travel(score, title, current_node)
    end
    @depth
  end

  def traverse_right(score, title, current_node)
    if current_node.node_right.nil?
      current_node.node_right = Node.new(score, title, current_node)
      @depth += 1
    else
      direction_of_node_travel(score, title, current_node)
    end
    @depth
  end

  def direction_of_node_travel(score, title, current_node)
    if score < current_node.score
      current_node = current_node.node_left
    else
      current_node = current_node.node_right
    end
    @depth += 1
    traverse_direction(score, title, current_node)
  end

  def include?(score, current_node = head)
    if current_node.nil?
      false
    elsif current_node.score == score
      true
    else
      include_traverse(score, current_node)
    end
  end

  def include_traverse(score, current_node)
    if score < current_node.score
      include?(score, current_node.node_left)
    else
      include?(score, current_node.node_right)
    end
  end

  def depth_of(score, current_node = @head, depth_of_score = 0)
    if current_node.nil?
      nil
    elsif current_node.score == score
      depth_of_score
    else
      depth_traverse(score, current_node, depth_of_score)
    end
  end

  def depth_traverse(score, current_node, depth_of_score)
    depth_of_score += 1
    if score < current_node.score
      depth_of(score, current_node.node_left, depth_of_score)
    else
      depth_of(score, current_node.node_right, depth_of_score)
    end
  end

  def max(current_node = @head)
    until current_node.node_right.nil?
      current_node = current_node.node_right
    end
    {current_node.title => current_node.score}
  end

  def min(current_node = @head)
    until current_node.node_left.nil?
      current_node = current_node.node_left
    end
    {current_node.title => current_node.score}
  end

  def sort #sorts ascending
    sort_subtree(@head).map do |node|
      {node.title => node.score}
    end
  end

  def sort_subtree(head)
    return [] if head.nil?
    if head.node_left && head.node_right
      [sort_subtree(head.node_left), head,
        sort_subtree(head.node_right)].flatten
    elsif head.node_right.nil?
      [sort_subtree(head.node_left), head].flatten
    else head.node_left.nil?
      [head, sort_subtree(head.node_right)].flatten
    end
  end

  def sort_descending #sorts descending (not part of project expectations)
    sort_subtree_descending(@head).map do |node|
      {node.title => node.score}
    end
  end

  def sort_subtree_descending(head)
    return [] if head.nil?
    if head.node_left && head.node_right
      [sort_subtree_descending(head.node_right), head,
        sort_subtree_descending(head.node_left)].flatten
    elsif head.node_right.nil?
      [head, sort_subtree_descending(head.node_left)].flatten
    else head.node_left.nil?
      [sort_subtree_descending(head.node_right), head].flatten
    end
  end

  def load(file)
    count = 0
    CSV.foreach(file) do |row|
      insert(row[0].to_i, row[1])
      count += 1
    end
    count
  end

end
