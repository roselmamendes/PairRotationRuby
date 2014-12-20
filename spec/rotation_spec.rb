require 'spec_helper'

describe Rotation do

	def returnAMember(name)
		Member.new name
	end

	before(:each) do
		@rotation = Rotation.new
		@rotation.project = "teste"
	end

	describe 'make a rotation' do
		it 'should add a pair' do
			expectedMember1 = returnAMember "Matheus"
			expectedMember2 = returnAMember "Thainan"
			pairs = [Pair.new(expectedMember1,expectedMember2)]
			
			@rotation.createAPair expectedMember1,expectedMember2

			expect(expectedMember1).to eq(@rotation.pairs[0].member1)
			expect(expectedMember2).to eq(@rotation.pairs[0].member2)
		end

		it 'should add two pairs' do
			expectedMember1 = returnAMember "Matheus"
			expectedMember2 = returnAMember "Thainan"
			expectedMember3 = returnAMember "Edla"
			expectedMember4 = returnAMember "Naan"

			pairs = [Pair.new(expectedMember1,expectedMember2),
				Pair.new(expectedMember3,expectedMember4)]

			@rotation.createAPair(expectedMember1,expectedMember2)
			@rotation.createAPair(expectedMember3,expectedMember4)

			expect(expectedMember1).to eq(@rotation.pairs[0].member1)
			expect(expectedMember2).to eq(@rotation.pairs[0].member2)
			expect(expectedMember3).to eq(@rotation.pairs[1].member1)
			expect(expectedMember4).to eq(@rotation.pairs[1].member2)
		end

		it 'should allow to add a member just when the project name is set' do
			expectedMember1 = returnAMember "Matheus"
			expectedMember2 = returnAMember "Thainan"
			localRotation = Rotation.new

			pairs = [Pair.new(expectedMember1,expectedMember2)]

			result = localRotation.createAPair(expectedMember1,expectedMember2)

			expect(result).to eq(-1)
		end

		it 'should not allow that a member already in a pair, participate to another pair' do
			expectedMember1 = returnAMember "Matheus"
			expectedMember2 = returnAMember "Thainan"
			expectedMember3 = returnAMember "Edla"
			
			@rotation.createAPair expectedMember1,expectedMember2

			result = @rotation.createAPair expectedMember1,expectedMember3

			expect(result).to eq(-2)
		end


	end 
end