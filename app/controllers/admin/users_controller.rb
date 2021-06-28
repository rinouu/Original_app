class Admin::UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :is_admin, only: [:edit, :update, :destroy, :show,:index, :new]
	before_action :set_user, only: [:edit, :update, :destroy, :show]
	
	def index
		@users = User.select(:id, :name)
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
		  	redirect_to admin_users_path
		else
		  	render :new
		end
	end

	def edit
	end

	def update
		if params[:admin]
			if @user.admin == true
				@user.update_attribute(:admin, false)
			else
				@user.update_attribute(:admin, true)
			end
		else
			if @user.update(user_params)
			    redirect_to admin_users_path, notice: "Profil edited!"
			else
			    render :edit
			end
		end
	end

	def show
		all_punctualities = @user.punctualities
		if params["date(1i)"]
			regdate =  Date.new(params["date(1i)"].to_i,
                    params["date(2i)"].to_i,
                    params["date(3i)"].to_i)
			@punctualities = all_punctualities.date_search(regdate).page params[:page]
		else
			@punctualities = all_punctualities.page params[:page]
		end
	end

	def destroy
		@user.destroy
		redirect_to admin_users_path, notice:"User deleted!"
	end

	private

	def user_params
		params.require(:user).permit(:name, :email, :password,
	                          	 :password_confirmation)
	end

	def set_user
		@user = User.find(params[:id])
	end

	def is_admin
		unless current_user.try(:admin?)
			redirect_to punctualities_path, notice:"Only administrators can access this page!!"
		end
	end
end