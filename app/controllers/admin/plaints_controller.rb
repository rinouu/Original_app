class Admin::PlaintsController < ApplicationController
	before_action :authenticate_user!
	before_action :is_admin
	
	def index
		all_plaints = Plaint.all
		if params[:category_id]
			@plaints = all_plaints.plaint_category_search(params[:category_id]).page params[:page]
		else
			@plaints = all_plaints.page params[:page]
		end
	end

	def edit
		@plaint = Plaint.find(params[:id])
		if @plaint.resolved == true
			@plaint.update_attribute(:resolved, false)
		else
			@plaint.update_attribute(:resolved, true)
			PlaintResolvedMailer.plaint_resolved_mail(@plaint,User.admin_search).deliver 
			redirect_to admin_plaints_path, notice: "Plaint resolved"
		end

	end

	private

	def is_admin
		unless current_user.try(:admin?)
			redirect_to punctualities_path, notice:"Only administrators can access this page!!"
		end
	end
end