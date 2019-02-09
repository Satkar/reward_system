require 'json'
require './lib/tree.rb'

# RewardSystem::Operation is inherited from a RewardSystem::Tree
# RewardSystem::Operation handles following operations
# 1. creates a new RewardSystem tree
# 2. Add a new referal to the reward system tree
# 3. Calculate the bonus details once referal accepts the request
# 4. Display the bonus details
module RewardSystem
  class Operation < RewardSystem::Tree
    attr_accessor :bonus_points, :bonus_ratio

    # Instanciate a new RewardSystem Tree
    # Params:
    # +bonus_points+:: if this value for this argument is not passed by default it will be 1
    # +bonus_ratio+:: if this value for this argument is not passed by default it will be 0.5
    def initialize(bonus_points = 1, bonus_ratio = 0.5)
      @bonus_points = bonus_points
      @bonus_ratio = bonus_ratio
      super()
    end

    # Add a new referal to RewardSystem Tree
    # Params:
    # +refree+:: is a string
    # +referal+:: is a string
    def add_referal(refree, referal)
      insert(referal, insert(refree).value)
    end

    # Calculates a referal bonus
    # Params:
    # +referal+:: is a string
    # +referal+:: is a string
    # This method basically does the following checks and operations
    # 1. Check in a RewardSystem Tree if perticular referal is present if not then return a  appropriate message
    # 2. if a referal is present in a RewardSystem Tree but it dose not have a refree then there is no need to calucate the referal bonus
    # 3. if referal has a refree then calculate the bonus to the refree chain which belongs to the referal
    def offer_accepted_by(referal)
      acceptor = search(referal)
      return "Not yet Added into a system" unless acceptor

      parent = acceptor.ancestor
      return "This is a first node" unless parent

      bonus = bonus_points
      update(acceptor, 'offer_accepted', true)

      begin
        bonus_holder = tree_details[parent]
        update(bonus_holder, 'referal_bonus', bonus)
        bonus = bonus.to_f * (bonus_ratio)
        parent = bonus_holder.ancestor
      end while(!parent.nil?)

    end

    # Displays the details of the RewardSystem Tree in a json format
    def details
      result = {}
      tree_details.each do |key, val|
        result[key] = val.referal_bonus.to_f
      end
      result.to_json
    end

  end
end
