require 'rails_helper'
RSpec.describe 'Plaint management function', type: :system do
  describe 'New creation function' do
    before do
      @user = FactoryBot.create(:user)
      @admin = FactoryBot.create(:admin)
      visit root_path
    end
    context 'When creating a new plaint' do
      it 'The created plaint is displayed' do
        fill_in 'email', with: @user.email
        fill_in 'password', with: @user.password
        click_button "Login"
        visit new_plaint_path
        fill_in 'plaint', with: 'plaint3'
        fill_in "description", with: "example"
        click_button "Register"
        expect(page).to have_content 'plaint3'
      end
    end
  end
  describe 'List display function' do
    before do
      @user = FactoryBot.create(:user2)
      @admin = FactoryBot.create(:admin)
      visit root_path
    end
    context 'When transitioning to the list screen' do
      it 'The created plaint list is displayed' do
        fill_in 'email', with: @user.email
        fill_in 'password', with: @user.password
        click_button "Login"
        plaint = FactoryBot.create(:plaint, title: 'plaint', description: "example2")
        visit plaints_path
        expect(page).to have_content 'plaint'
      end
    end
  end
  describe 'Detailed display function' do
    before do
      @user = FactoryBot.create(:user3)
      @admin = FactoryBot.create(:admin)
      visit root_path
    end
    context 'When transitioned to any plaint details screen' do
      it 'The content of the relevant plaint is displayed' do
        fill_in 'email', with: @user.email
        fill_in 'password', with: @user.password
        click_button "Login"
        plaint = FactoryBot.create(:plaint, title: 'plaint', description: "example2")
        visit plaint_path(plaint.id)
        expect(page).to have_content 'plaint'
      end
    end
  end
end