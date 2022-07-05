require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/binary_search_tree'

class BinarySearchTreeTest < Minitest::Test

  def test_if_it_exists
    bst = BinarySearchTree.new

    assert_instance_of BinarySearchTree, bst
  end


end
