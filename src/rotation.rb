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
		if(@project.empty?)
			return CAN_NOT_PROCEED
		elsif hasAPair(member1) != nil || hasAPair(member2) != nil
			return CAN_NOT_PROCEED
		end
		
		@pairs.push(Pair.new member1,member2)
		SUCESS
	end

	def hasAPair(member)
		result = pairs.bsearch{|pair| pair.member1.name == member.name}
		return result if result != nil
		result = pairs.bsearch{|pair| pair.member2.name == member.name}
		return result if result != nil
		nil
	end
end