require 'rails_helper'
RSpec.describe 'category management function', type: :system do
  describe 'New creation function' do
    before do
      @user = FactoryBot.create(:user)
      @user2 = FactoryBot.create(:user2)
      #@plaint_category = FactoryBot.create(:plaint_category)
      @category = FactoryBot.create(:category)
      @category2 = FactoryBot.create(:category2)
    end
    context 'When creating a new plaint' do
      it 'Multiple categorys can be registered with it' do
        visit new_user_session_path
        fill_in 'email', with: @user.email
        fill_in 'password', with: @user.password
        click_button "Login"
        plaint = FactoryBot.create(:plaint, title: 'plaint1', user_id: @user.id)
        categorylin1 = FactoryBot.create(:plaint_category, category_id: @category.id , plaint_id: plaint.id)
        categorylin2 = FactoryBot.create(:plaint_category, category_id: @category2.id , plaint_id: plaint.id)
        visit plaints_path
        expect(page).to have_content 'plaint1'
      end
    end
    context 'When going on the plaint details screen' do
      it 'Output the list of categories associated with the plaint' do
        visit new_user_session_path
        fill_in 'email', with: @user.email
        fill_in 'password', with: @user.password
        click_button "Login"
        plaint = FactoryBot.create(:plaint, title: 'plaint1', user_id: @user.id)
        categorylin1 = FactoryBot.create(:plaint_category, category_id: @category.id , plaint_id: plaint.id)
        categorylin2 = FactoryBot.create(:plaint_category, category_id: @category2.id , plaint_id: plaint.id)
        visit plaint_path(plaint.id)
        expect(page).to have_content 'category 1'
        expect(page).to have_content 'category 2'
      end
    end
    context 'When you search for category' do
      it "plaints contain the categorys are narrowed down" do
        visit new_user_session_path
        fill_in 'email', with: @user.email
        fill_in 'password', with: @user.password
        click_button "Login"
        search_category = "category 1"
        visit plaints_path(category_id: @category.id)
        expect(page).to have_content search_category
      end
    end
  end
end