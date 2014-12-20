require 'spec_helper'

describe Member do
	describe 'Initialize a member' do
		it 'should create a member with role QA' do
			member = Member.new "Derek",QA
			expect(member.role).to eq(QA)
		end

		it 'should create a member with role DEV' do
			member = Member.new "Charles",DEV
			expect(member.role).to eq(DEV)
		end

		it 'should create a member with role BA' do
			member = Member.new "Charles",BA
			expect(member.role).to eq(BA)
		end

		it 'should create a member with role UX' do
			member = Member.new "Charles",UX
			expect(member.role).to eq(UX)
		end
	end
end