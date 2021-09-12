require 'rails_helper'

RSpec.describe User, type: :model do
	describe 'Validation test' do
		context 'If the User name is empty' do
			it 'It is hard to Validation' do
				user = User.new(name: '', email: "hi@dive.l", password: "123456", password_confirmation: "123456")
				expect(user).not_to be_valid
			end
	    end
	    context 'If the user email is empty' do
			it 'Validation is not pass' do
				user = User.new(name: 'no', email: "", password: "123456", password_confirmation: "123456")
				expect(user).not_to be_valid
			end
	    end
	    context 'If the user password or password_confirmation is empty' do
			it 'It is hard to Validation' do
				user = User.new(name: 'no', email: "ho@dive.l", password: "", password_confirmation: "123456")
				user2 = User.new(name: 'no', email: "ho@dive.l", password: "123456", password_confirmation: "")
				expect(user).not_to be_valid
				expect(user2).not_to be_valid
			end
	    end
	    context 'If the user password and password_confirmation are different' do
			it 'Validation is not pass' do
				user = User.new(name: 'no', email: "ho@dive.l", password: "789456", password_confirmation: "123456")
				expect(user).not_to be_valid
			end
	    end
	    context 'If the user password and password_confirmation are less than 6 characters' do
			it 'Validation is not pass' do
				user = User.new(name: 'no', email: "ho@dive.l", password: "7456", password_confirmation: "7456")
				expect(user).not_to be_valid
			end
	    end
	    context 'If the User Name and email are present; password is at least 6 characters and matches with password_confirmation' do
			it 'Validation passes' do
				user = User.new(name: 'no', email: "hi@dive.l", password: "123456", password_confirmation: "123456")
				expect(user).to be_valid
			end
	    end
    end
end
