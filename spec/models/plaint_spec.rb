require 'rails_helper'

RSpec.describe Plaint, type: :model do
    describe 'Validation test' do
    	before do
	      @user = FactoryBot.create(:user)
    	end
	    context 'If the plaint Title is empty' do
			it 'It is hard to Validation' do
				plaint = Plaint.new(title: '', description: 'Failure test', user_id: @user.id)
				expect(plaint).not_to be_valid
			end
	    end
	    context 'If the plaint description are empty' do
			it 'Validation is not pass' do
				plaint = Plaint.new(title: 'plaint', description: '', user_id: @user.id)
				expect(plaint).not_to be_valid
			end
	    end
	    context 'If the plaint Title and description are described' do
			it 'Validation passes' do
				plaint = Plaint.new(title: 'plaint', description: 'Failure test', user_id: @user.id)
				expect(plaint).to be_valid
			end
	    end
    end
end
