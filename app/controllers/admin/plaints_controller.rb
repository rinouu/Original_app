class Admin::PlaintsController < ApplicationController
	skip_before_action :login_required
	before_action :is_admin
	
	def index
		@plaints = Plaint.all
	end

	private

	def is_admin
		if current_user.admin == false || current_user.admin.blank?
			redirect_to plaints_path, notice:"Only administrators can access this page!!"
		end
	end
end
