require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/node'

class NodeTest < Minitest::Test

  def test_if_it_exists
    node = Node.new(61, "Bill & Ted's Excellent Adventure")

    assert_instance_of Node, node
  end

  def test_if_it_has_attributes
    node = Node.new(61, "Bill & Ted's Excellent Adventure")

    assert_equal 61, node.score
    assert_equal "Bill & Ted's Excellent Adventure", node.title
    assert_nil node.node_left
    assert_nil node.node_right
  end

end
