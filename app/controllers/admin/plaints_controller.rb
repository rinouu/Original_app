class Admin::PlaintsController < ApplicationController
	before_action :authenticate_user!
	before_action :is_admin
	
	def index
		@plaints = Plaint.all
	end

	private

	def is_admin
		unless current_user.try(:admin?)
			redirect_to punctualities_path, notice:"Only administrators can access this page!!"
		end
	end
end