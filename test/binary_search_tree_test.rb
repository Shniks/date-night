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


end
