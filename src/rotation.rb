class Rotation
	@@members = {}

	def self.members
		@@members
	end

	def self.createAPair members
		@@members = members
	end
end