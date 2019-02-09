require 'test/unit'
require './lib/node.rb'
require 'node.rb'

class NodeTest < Test::Unit::TestCase
  def test_new_node
   	node = RewardSystem::Node.new('A')
    assert_equal(node.value, 'A', "Value of node should be A")
    assert_equal(node.ancestor, nil, "ancestor of new node should be nil")
    assert_equal(node.offer_accepted, false, "offer_accepted of new node should be false")
    assert_equal(node.referal_bonus, 0, "referal_bonus of new node should be 0")
  end

  def test_update_node
   	node = RewardSystem::Node.new('B')
   	node1 = node.update_node('offer_accepted', true)
   	node2 = node.update_node('referal_bonus', 25)
   	node3 = node.update_node('other_field', 25)
    assert_equal(node1.offer_accepted, true, "offer_accepted should be true")
    assert_equal(node2.referal_bonus, 25, "referal_bonus should be 25")
    assert_equal(node3, "No operation needed.", "No operation needed.")
  end


end

