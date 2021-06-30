class Admin::PlaintsController < ApplicationController
	before_action :authenticate_user!
	before_action :is_admin
	
	def index
		all_plaints = Plaint.all
		if params[:category_id]
			@plaints = all_plaints.plaint_category_search(params[:category_id]).order('created_at DESC').page params[:page]
		else
			@plaints = all_plaints.order('created_at DESC').page params[:page]
		end
	end

	def edit
		@plaint = Plaint.find(params[:id])
		respond_to do |format|
			if @plaint.resolved == true
				@plaint.update_attribute(:resolved, false)
				format.html { redirect_to admin_plaints_path, notice: "Plaint no-resolved" }
			else
				@plaint.update_attribute(:resolved, true)
				PlaintResolvedMailer.plaint_resolved_mail(@plaint,User.admin_search).deliver
				@plaints = Plaint.all.order('created_at DESC').page params[:page]
				format.js { render :edit }
				format.html { redirect_to admin_plaints_path, notice: "Plaint resolved" }
			end
		end	
	end

	private

	def is_admin
		unless current_user.try(:admin?)
			redirect_to punctualities_path, notice:"Only administrators can access this page!!"
		end
	end
end