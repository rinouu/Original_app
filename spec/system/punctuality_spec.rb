require 'rails_helper'
RSpec.describe 'Punctuality management function', type: :system do
  describe 'New creation function' do
    before do
      @user = FactoryBot.create(:user)
      @admin = FactoryBot.create(:admin)
      visit new_user_session_path
    end
    context 'When creating a new punctuality' do
      it 'The created punctuality is displayed' do
        fill_in 'email', with: @user.email
        fill_in 'password', with: @user.password
        click_button "Login"
        visit new_punctuality_path
        select '10', :from => 'punctuality_arrival_time_4i'
        select '00', :from => 'punctuality_arrival_time_5i'
        select '18', :from => 'punctuality_departure_time_4i'
        select '00', :from => 'punctuality_departure_time_5i'
        click_button "Register"
        expect(page).to have_content '06:00PM'
      end
    end
  end
  describe 'Search function' do
    before do
      @user = FactoryBot.create(:user)
    end
    context 'When you search for date' do
      it "Punctualities that exactly match the date are narrowed down" do
        visit new_user_session_path
        fill_in 'email', with: @user.email
        fill_in 'password', with: @user.password
        click_button "Login"
        visit new_punctuality_path
        select '10', :from => 'punctuality_arrival_time_4i'
        select '00', :from => 'punctuality_arrival_time_5i'
        select '18', :from => 'punctuality_departure_time_4i'
        select '00', :from => 'punctuality_departure_time_5i'
        click_button "Register"
        search_date = DateTime.now.to_date + 1.day
        visit punctualities_path(date: search_date)
        expect(page).to_not have_content search_date.to_s
      end
    end
  end
end