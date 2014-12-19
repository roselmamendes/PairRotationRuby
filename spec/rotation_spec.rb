require 'spec_helper'

describe Rotation do
	describe 'make a rotation' do
		it 'should add a pair' do
			member1 = Member.new "Matheus"
			member2 = Member.new "Thainan"
			members = [member1,member2]
			Rotation.createAPair Array[member1,member2]
			expect(Rotation.members).to match_array(members)
		end

		it 'should add two pairs' do
			
		end
	end 
end