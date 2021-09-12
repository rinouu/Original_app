require 'rails_helper'

RSpec.describe Punctuality, type: :model do
	describe 'Validation test' do
    	before do
	      @user = FactoryBot.create(:user)
    	end
	    context 'If the punctuality arrival_time is empty' do
			it 'It is hard to Validation' do
				punctuality = Punctuality.new(arrival_time: '', departure_time: DateTime.now.to_s(:time), user_id: @user.id)
				expect(punctuality).not_to be_valid
			end
	    end
	    context 'If the punctuality departure_time is empty' do
			it 'Validation is not pass' do
				punctuality = Punctuality.new(arrival_time: DateTime.now.to_s(:time), departure_time: "", user_id: @user.id)
				expect(punctuality).not_to be_valid
			end
	    end
	    context 'If the punctuality arrival_time and departure_time are described' do
			it 'Validation passes' do
				punctuality = Punctuality.new(arrival_time: DateTime.now.to_s(:time), departure_time: DateTime.now.to_s(:time), user_id: @user.id)
				expect(punctuality).to be_valid
			end
	    end
    end
end
