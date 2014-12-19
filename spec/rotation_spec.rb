require 'spec_helper'

describe Rotation do
	describe 'make a rotation' do
		it 'should add a pair' do
			expectedMember1 = Member.new "Matheus"
			expectedMember2 = Member.new "Thainan"
			pairs = [Pair.new(expectedMember1,expectedMember2)]
			rotation = Rotation.new
			rotation.createAPair expectedMember1,expectedMember2

			expect(expectedMember1).to eq(rotation.pairs[0].member1)
			expect(expectedMember2).to eq(rotation.pairs[0].member2)
		end

		it 'should add two pairs' do
			expectedMember1 = Member.new "Matheus"
			expectedMember2 = Member.new "Thainan"
			expectedMember3 = Member.new "Edla"
			expectedMember4 = Member.new "Naan"

			pairs = [Pair.new(expectedMember1,expectedMember2),
				Pair.new(expectedMember3,expectedMember4)]

			rotation = Rotation.new

			rotation.createAPair(expectedMember1,expectedMember2)
			rotation.createAPair(expectedMember3,expectedMember4)

			expect(expectedMember1).to eq(rotation.pairs[0].member1)
			expect(expectedMember2).to eq(rotation.pairs[0].member2)
			expect(expectedMember3).to eq(rotation.pairs[1].member1)
			expect(expectedMember4).to eq(rotation.pairs[1].member2)
		end
	end 
end