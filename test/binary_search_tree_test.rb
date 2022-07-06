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

  def test_it_can_insert_and_find_depth_of_third_node_to_the_right
    @tree.insert(61, "Bill & Ted's Excellent Adventure")
    @tree.insert(16, "Johnny English")
    new_node = @tree.insert(92, "Sharknado 3")

    assert_equal 1, new_node
  end

  def test_it_can_insert_and_find_depth_of_fourth_node
    @tree.insert(61, "Bill & Ted's Excellent Adventure")
    @tree.insert(16, "Johnny English")
    @tree.insert(92, "Sharknado 3")
    new_node = @tree.insert(50, "Hannibal Buress: Animal Furnace")

    assert_equal 2, new_node
    refute_equal 1, new_node
  end

  def test_it_can_insert_and_find_depth_of_eighth_node
    @tree.insert(61, "Bill & Ted's Excellent Adventure")
    @tree.insert(16, "Johnny English")
    @tree.insert(92, "Sharknado 3")
    @tree.insert(50, "Hannibal Buress: Animal Furnace")
    @tree.insert(40, "Transformers 1")
    @tree.insert(45, "Transformers 2")
    @tree.insert(55, "Transformers 3")
    new_node = @tree.insert(33, "Transformers 4")

    assert_equal 4, new_node
    refute_equal 2, new_node
  end

  def test_it_can_verify_presence_of_score_in_the_tree
    @tree.insert(61, "Bill & Ted's Excellent Adventure")
    @tree.insert(16, "Johnny English")
    @tree.insert(92, "Sharknado 3")
    @tree.insert(50, "Hannibal Buress: Animal Furnace")

    assert @tree.include?(16)
    assert @tree.include?(50)
    assert @tree.include?(61)
    refute @tree.include?(72)
  end

  def test_it_can_find_depth_of_tree_where_score_appears
    @tree.insert(61, "Bill & Ted's Excellent Adventure")
    @tree.insert(16, "Johnny English")
    @tree.insert(92, "Sharknado 3")
    @tree.insert(50, "Hannibal Buress: Animal Furnace")

    assert_equal 1, @tree.depth_of(92)
    assert_equal 2, @tree.depth_of(50)
    assert_nil @tree.depth_of(60)
  end

end
