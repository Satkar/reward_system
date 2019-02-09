require 'test/unit'
require './lib/operation.rb'

class OperationTest < Test::Unit::TestCase
  def tree
    @tree = RewardSystem::Operation.new
  end

  def test_add_referal
    node = tree.add_referal('A', 'B')
    assert_equal(node.value, 'B', "Value of node should be B")
    assert_equal(node.ancestor, 'A', "Value of ancestor should be A")
  end

  def test_offer_accepted_by
    tree
    @tree.add_referal('A', 'B')
    @tree.add_referal('A', 'C')
    @tree.offer_accepted_by('E')
    assert_equal(@tree.offer_accepted_by('E'), "Not yet Added into a system")
  end

  def test_details
    tree
    @tree.add_referal('A', 'B')
    @tree.add_referal('A', 'C')
    @tree.offer_accepted_by('B')
    @tree.offer_accepted_by('C')
    assert_equal(JSON.parse(@tree.details), {"A"=>2.0, "B"=>0.0, "C"=>0.0})
  end
end
