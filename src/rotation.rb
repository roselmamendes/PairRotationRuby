require_relative '../src/pair'

NO_PROJECT_NAME = -1
MEMBER_IN_PAIR = -2
SUCESS = 1

class Rotation
	attr_accessor :members,:pairs,:project

	def initialize 
		@members = Array.new
		@pairs = Array.new
		@project = ""
	end

	def addMember member
		@members.push member
	end

	def createAPair member1,member2
		return NO_PROJECT_NAME if(@project.empty?)
		return MEMBER_IN_PAIR if hasAPair(member1) != nil || hasAPair(member2) != nil

		@pairs.push(Pair.new member1,member2)
		SUCESS
	end

	def hasAPair member
		result = pairs.bsearch{|pair| pair.member1.name == member.name || pair.member2.name == member.name}
		return result if result != nil
		nil
	end
end