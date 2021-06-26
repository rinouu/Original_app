class PlaintsController < ApplicationController
	before_action :set_plaint, only: [:edit, :update, :show, :destroy]
	def index
		@plaints = Plaint.user_plaint_list(current_user.id).page params[:page]
	end

	def new
		@plaint = Plaint.new
	end

	def create
		@plaint = current_user.plaints.build(plaint_params)
		if params[:back]
	  		render :new
		else
			if @plaint.save
				redirect_to plaints_path, notice: "plaint created!"
			else
				render :new
			end
		end
	end


	def edit
	end

	def update
		if @plaint.update(plaint_params)
	  		redirect_to plaints_path, notice: "plaint edited!"
		else
	  		render :edit
		end
	end

	def show
	end

	def destroy
		@plaint.destroy
		redirect_to plaints_path, notice:"plaint deleted!"
	end

	private

	def plaint_params
		params.require(:plaint).permit(:title,:description,:remarks)
	end

	def set_plaint
		@plaint = Plaint.find(params[:id])
	end
end
