class StaticsController < ApplicationController
	before_action :authenticate_user!
	def top
		if current_user.sign_in_count != 1
			redirect_to punctualities_path
		end
	end
end
