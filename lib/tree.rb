require './lib//node.rb'

# This module basically handles following operations
# 1. Creating a new Tree structue
# 2. Insert new node to the tree
# 3. Search a node in a tree
# 4. Update a node of a tree
module RewardSystem
  class Tree

    attr_accessor :tree_details

    # creates an empty tree detail
    def initialize
      @tree_details = {}
    end

    # Inserts a new node to the tree
    # Params:
    # +node_name+:: name of the node is a 'string'
    # +parent_name+:: parent of the node is a 'string'
    #
    # = Example 1 When parent name is not passed as an argument to the method
    #   node = RewardSystem::Node.new('A')
    #   tree = RewardSystem::Tree.new
    #   tree.insert(node)
    #
    # = Example 2 When parent name is  passed as an argument to the method
    #   node = RewardSystem::Node.new('B')
    #   tree = RewardSystem::Tree.new
    #   tree.insert(node, 'A')
    #
    # This method basically inserts a new node into the tree
    # 1. if a node is already present in a tree it fetches it and returns
    # 2. if a node is not present in a tree. It inserts a new node to the tree also assigns a parent
    #    if parent name is provided and returns a new node
    def insert(node_name, parent_name=nil)
      node = search(node_name)
      return node if node
      node = RewardSystem::Node.new(node_name)
      node.ancestor = parent_name
      tree_details[node_name] = node
      node
    end

    # Search for a node in the tree by node name
    # Params:
    # +node_name+:: name of a node is a string
    def search(node_name)
      tree_details[node_name]
    end

    # Update an existing node of a tree
    # Params:
    # +node+:: it is a object of RewardSystem::Node
    # +field_name+:: field_name is a 'string'
    # +value+:: value will be float
    #
    # = Example 1 updating offer_accepted attribute
    #   node = RewardSystem::Node.new('A')
    #   tree = RewardSystem::Tree.new
    #   tree.update(node, 'offer_accepted', true)
    def update(node, field_name, value)
      node.update_node(field_name, value)
    end

  end
end
