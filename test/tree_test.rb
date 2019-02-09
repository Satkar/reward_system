require 'test/unit'
require './lib/tree.rb'

class NodeTest < Test::Unit::TestCase
  def tree
    @tree = RewardSystem::Tree.new
  end

  def test_insert
    node = tree.insert('A')
    assert_equal(node.value, 'A', "Value of node should be A")
    assert_equal(node.ancestor, nil, "Value of ancestor should be nil")

    node_with_parent = tree.insert('B', 'A')
    assert_equal(node_with_parent.value, 'B', "Value of node should be B")
    assert_equal(node_with_parent.ancestor, 'A', "Value of ancestor should be A")
  end

  def test_search
    tree
    @tree.insert('A')
    @tree.insert('B', 'A')
    @tree.insert('C', 'A')

    assert_equal(@tree.search('A').value, 'A', "Value of node should be B")
    assert_equal(@tree.search('E'), nil, "Value of node should be nil")
  end
end
