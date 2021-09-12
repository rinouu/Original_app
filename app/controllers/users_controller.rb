class UsersController < ApplicationController
	before_action :authenticate_user!
	def show
		@user = User.find_by_id(params[:id])
	    if current_user.id != @user.id
  			redirect_to plaints_path
  		end
	end
end
