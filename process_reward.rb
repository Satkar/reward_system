# require './lib/operation.rb'

require 'reward_system'

# This is a consumer class which basicall consumes the services of the gem and does below operation
# 1. Accepts a file to be read
# 2. Accepts the bonus points and in what ratio bonus to be distributed in the parental chain
class ProcessReward

	attr_accessor :file_path, :reward_system

	# In this method input required for the bonus points for each referal and in what ratio bonus to be distributed in the parental chain
	# Accepts a file path
	def initialize
		puts "Enter the bonus points for refree"
		points = gets.to_f
		puts "Enter the ration on which it has to be rewarded to others"
		ratio = gets.to_f
		@reward_system = RewardSystem::Operation.new(points, ratio)
		p "Please Enter file path"
		@file_path = gets.chomp()
	end

	# This method does the following operations
	# 1. Check if file exists if not return an appropriiate message
	# 2. If file exists then read the line and process the same
	# As of now this method holds good with .txt file and with below content format
	#  2018-06-12 09:41 A recommends B
	#  2018-06-14 09:41 B accepts
	#  2018-06-16 09:41 B recommends C
	#  2018-06-17 09:41 C accepts
	#  2018-06-19 09:41 C recommends D
	#  2018-06-23 09:41 B recommends D
	#  2018-06-25 09:41 D accepts
	def process
		return puts "File not found" unless File.file?(file_path)
		File.open("#{file_path}", "r").each_line do |line|
			ar = line.split(" ")
			by, operation, to  = ar - ar[0..1]
			reward_system.add_referal(by, to) if operation == 'recommends'
			reward_system.offer_accepted_by(by) if operation == 'accepts'
		end
	end

	# Displays a processed result
	def result
		puts reward_system.details
	end
end

r = ProcessReward.new
r.process
r.result
