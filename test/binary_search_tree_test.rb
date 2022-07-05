require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/binary_search_tree'

class BinarySearchTreeTest < Minitest::Test

  def test_if_it_exists
    tree = BinarySearchTree.new

    assert_instance_of BinarySearchTree, tree
  end

  def test_if_the_head_node_is_initially_nil
    tree = BinarySearchTree.new

    assert_nil tree.head
  end

  def test_it_can_insert_a_head_node
    tree = BinarySearchTree.new
    result = tree.insert_head_node(61, "Bill & Ted's Excellent Adventure")

    assert_instance_of Node, result
    assert_equal 61, result.score
    assert_equal "Bill & Ted's Excellent Adventure", result.title
    assert_nil result.node_left
    assert_nil result.node_right
  end




end
