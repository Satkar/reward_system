# This module basically handles following operations
# 1. Creating a new node
# 2. Update a node
module RewardSystem
  class Node
    attr_accessor :value, :ancestor, :offer_accepted, :referal_bonus

    # Creates a new node for the tree
    # Params:
    # +value+:: is going to be name of the node
    # = Example 1
    #   RewardSystem::Node.new('A')
    def initialize(value)
      @value = value
      @ancestor = nil
      @offer_accepted = false
      @referal_bonus = 0
    end

    # Updates the existing node of a tree
    # Params:
    # +field_name+:: name of the attribute to be updated
    # +value+:: new value to be set for the attribute
    #
    # = Example 1 To update offer_accepted value
    #   node = RewardSystem::Node.new('A')
    #   node.update_node('offer_accepted', true)
    #
    # = Example 2 To update referal_bonus value
    #   node = RewardSystem::Node.new('B')
    #   node.update_node('offer_accepted', 35)
    #
    # As of now we will be updating offer_accepted and referal_bonus if any other field name is passed
    # 'No operation needed.' message will be returned
    def update_node(field_name, value)
      case field_name
      when 'offer_accepted'
        self.offer_accepted = value
      when 'referal_bonus'
        self.referal_bonus += value
      else
        return "No operation needed."
      end
      self
    end

  end
end
