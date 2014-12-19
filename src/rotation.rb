require_relative '../src/pair'

CAN_NOT_PROCEED = -1
SUCESS = 1

class Rotation
	attr_accessor :pairs,:project

	def initialize 
		@pairs = Array.new
		@project = ""
	end

	def createAPair member1,member2
		if(!@project.empty?)
			@pairs.push(Pair.new member1,member2)
			return SUCESS
		end
		CAN_NOT_PROCEED
	end
end