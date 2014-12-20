QA = "QA"
DEV = "DEV"
BA = "BA"
UX = "UX"

class Member

	attr_accessor :name,:role

	def initialize name,role
		@name = name
		@role = role
	end
end