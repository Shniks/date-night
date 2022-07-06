require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/binary_search_tree'

class BinarySearchTreeTest < Minitest::Test

  def setup
    @tree = BinarySearchTree.new
  end

  def test_if_it_exists
    assert_instance_of BinarySearchTree, @tree
  end

  def test_if_the_head_node_is_initially_nil
    assert_nil @tree.head
  end

  def test_it_can_insert_a_head_node
    new_node = @tree.insert_head_node(61, "Bill & Ted's Excellent Adventure")

    assert_instance_of Node, new_node
    assert_equal 61, new_node.score
    assert_equal "Bill & Ted's Excellent Adventure", new_node.title
    assert_nil new_node.node_left
    assert_nil new_node.node_right
  end

  def test_it_can_find_depth_of_node
    new_node = @tree.insert(61, "Bill & Ted's Excellent Adventure")

    assert_equal 0, new_node
  end

  def test_it_can_insert_a_second_node_to_the_left
    @tree.insert(61, "Bill & Ted's Excellent Adventure")
    new_node = @tree.insert(16, "Johnny English")

    assert_equal 1, new_node
  end




end
