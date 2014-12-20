require 'spec_helper'

describe Rotation do

	def returnAMember name,role
		Member.new name,role
	end

	def iniatializeRotation
		@rotation = Rotation.new
		@rotation.project = "teste"
	end

	describe 'make a rotation' do
		it 'should add a pair' do
			expectedMember1 = returnAMember "Matheus",DEV
			expectedMember2 = returnAMember "Thainan",DEV
			
			iniatializeRotation

			@rotation.createAPair expectedMember1,expectedMember2

			expect(expectedMember1).to eq(@rotation.pairs[0].member1)
			expect(expectedMember2).to eq(@rotation.pairs[0].member2)
		end

		it 'should add two pairs' do
			expectedMember1 = returnAMember "Matheus",DEV
			expectedMember2 = returnAMember "Thainan",DEV
			expectedMember3 = returnAMember "Edla",QA
			expectedMember4 = returnAMember "Naan",QA

			iniatializeRotation

			@rotation.createAPair(expectedMember1,expectedMember2)
			@rotation.createAPair(expectedMember3,expectedMember4)

			expect(expectedMember1).to eq(@rotation.pairs[0].member1)
			expect(expectedMember2).to eq(@rotation.pairs[0].member2)
			expect(expectedMember3).to eq(@rotation.pairs[1].member1)
			expect(expectedMember4).to eq(@rotation.pairs[1].member2)
		end

		it 'should allow to add a member just when the project name is set' do
			expectedMember1 = returnAMember "Matheus",DEV
			expectedMember2 = returnAMember "Thainan",DEV
			localRotation = Rotation.new

			result = localRotation.createAPair(expectedMember1,expectedMember2)

			expect(result).to eq(NO_PROJECT_NAME)
		end

		it 'should not allow that a member already in a pair, participate to another pair' do
			expectedMember1 = returnAMember "Matheus",DEV
			expectedMember2 = returnAMember "Thainan",DEV
			expectedMember3 = returnAMember "Edla",QA
			
			iniatializeRotation

			@rotation.createAPair expectedMember1,expectedMember2

			result = @rotation.createAPair expectedMember1,expectedMember3

			expect(result).to eq(MEMBER_IN_PAIR)
		end

		it 'should add a member' do
			expectedMember1 = returnAMember "Jessica", QA

			iniatializeRotation

			@rotation.addMember expectedMember1

			expect(@rotation.members.size).to eq(1)
			expect(@rotation.members[0]).to eq(expectedMember1)
		end

	end 
end