require_relative '../src/pair'

class Rotation
	attr_accessor :pairs

	def initialize 
		@pairs = Array.new
	end

	def createAPair member1,member2
		@pairs.push(Pair.new member1,member2)
	end
end