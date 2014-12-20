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

	def createAPair memberName1,memberName2
		return NO_PROJECT_NAME if(@project.empty?)
		return MEMBER_IN_PAIR if hasAPair(memberName1) != nil || hasAPair(memberName2) != nil
		
		member1 = members.bsearch{|memberToSearch| memberToSearch.name == memberName1}
		member2 = members.bsearch{|memberToSearch| memberToSearch.name == memberName2}

		@pairs.push(Pair.new member1,member2)
		SUCESS
	end

	def hasAPair memberName
		result = pairs.bsearch{|pair| pair.member1.name == memberName || pair.member2.name == memberName}
		return result if result != nil
		nil
	end
end