class StaticsController < ApplicationController
	#before_action :authenticate_user!

	def top
		if current_user.present?
			redirect_to punctualities_path
		end
	end

	def guest_login
		current_user2
		sign_in current_user
		redirect_to punctualities_path
	end

	def administrator_guest_login
		current_user2
		current_user.update(admin:true)
		sign_in current_user
		redirect_to punctualities_path
	end
end
