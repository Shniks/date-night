require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/binary_search_tree'

class BinarySearchTreeTest < Minitest::Test

  def setup
    @tree = BinarySearchTree.new
    @movies_list = { 61 => ["Bill & Ted's Excellent Adventure", 0],
    16 => ["Johnny English", 1], 92 => ["Sharknado 3", 1],
    50 => ["Hannibal Buress: Animal Furnace", 2], 40 => ["Transformers1", 3],
    45 => ["Transformers2", 4], 55 => ["Transformers3", 3],
    94 => ["Transformers4", 2], 90 => ["Transformers5", 2],
    35 => ["Transformers6", 4], 98 => ["Transformers7", 3],
    70 => ["Transformers8", 3] }
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

  def test_it_can_find_movie_with_highest_score
    @tree.insert(61, "Bill & Ted's Excellent Adventure")
    @tree.insert(16, "Johnny English")
    @tree.insert(92, "Sharknado 3")
    @tree.insert(50, "Hannibal Buress: Animal Furnace")

    assert_equal ({"Sharknado 3"=>92}), @tree.max
    refute_equal ({"Johnny English"=>16}), @tree.max
  end

  def test_it_can_find_movie_with_highest_score_in_list_of_12_movies
    @movies_list.each do |k, v|
      @tree.insert(k, v[0])
    end

    assert_equal ({"Transformers7"=>98}), @tree.max
    refute_equal ({"Johnny English"=>16}), @tree.max
  end

  def test_it_can_find_movie_with_lowest_score
    @tree.insert(61, "Bill & Ted's Excellent Adventure")
    @tree.insert(16, "Johnny English")
    @tree.insert(92, "Sharknado 3")
    @tree.insert(50, "Hannibal Buress: Animal Furnace")

    assert_equal ({"Johnny English"=>16}), @tree.min
    refute_equal ({"Sharknado 3"=>92}), @tree.min
  end

  def test_it_can_find_movie_with_lowest_score_in_list_of_12_movies
    @movies_list.each do |k, v|
      @tree.insert(k, v[0])
    end

    assert_equal ({"Johnny English"=>16}), @tree.min
    refute_equal ({"Transformers2"=>45}), @tree.min
  end

  def test_it_can_sort_movies_in_ascending_order
    @tree.insert(61, "Bill & Ted's Excellent Adventure")
    @tree.insert(16, "Johnny English")
    @tree.insert(92, "Sharknado 3")
    @tree.insert(50, "Hannibal Buress: Animal Furnace")

    expected = [{"Johnny English"=>16},
                {"Hannibal Buress: Animal Furnace"=>50},
                {"Bill & Ted's Excellent Adventure"=>61},
                {"Sharknado 3"=>92}]

    assert_equal expected, @tree.sort
  end

  def test_it_can_sort_tree_with_twelve_values
    @movies_list.each do |k, v|
      @tree.insert(k, v[0])
    end

    expected = [{"Johnny English"=>16},
                {"Transformers6"=>35},
                {"Transformers1"=>40},
                {"Transformers2"=>45},
                {"Hannibal Buress: Animal Furnace"=>50},
                {"Transformers3"=>55},
                {"Bill & Ted's Excellent Adventure"=>61},
                {"Transformers8"=>70},
                {"Transformers5"=>90},
                {"Sharknado 3"=>92},
                {"Transformers4"=>94},
                {"Transformers7"=>98}]

    assert_equal expected, @tree.sort
  end

  def test_it_can_sort_tree_with_twelve_values_in_descending_order
    @movies_list.each do |k, v|
      @tree.insert(k, v[0])
    end

    expected = [{"Transformers7"=>98},
                {"Transformers4"=>94},
                {"Sharknado 3"=>92},
                {"Transformers5"=>90},
                {"Transformers8"=>70},
                {"Bill & Ted's Excellent Adventure"=>61},
                {"Transformers3"=>55},
                {"Hannibal Buress: Animal Furnace"=>50},
                {"Transformers2"=>45},
                {"Transformers1"=>40},
                {"Transformers6"=>35},
                {"Johnny English"=>16}]

    assert_equal expected, @tree.sort_descending
  end

  def test_it_can_load_movies_from_a_text_file
    assert_equal 99, @tree.load('./movies.txt')
  end

  def test_how_many_nodes_have_no_left_or_right_value
    @tree.insert(98, "Animals United")
    @tree.insert(58, "Armageddon")
    @tree.insert(36, "Bill & Ted's Bogus Journey")
    @tree.insert(93, "Bill & Ted's Excellent Adventure")
    @tree.insert(86, "Charlie's Angels")
    @tree.insert(38, "Charlie's Country")
    @tree.insert(69, "Collateral Damage")

    assert_equal 2, @tree.leaves 
  end

end
