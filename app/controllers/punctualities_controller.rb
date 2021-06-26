class PunctualitiesController < ApplicationController
	skip_before_action :login_required, only: [:index, :new, :create]

	def index
		@punctualities = Punctuality.user_punctuality_list(current_user.id).page params[:page]
	end

	def new
		@punctuality = Punctuality.new
	end

	def create
		@plaint = current_user.punctualities.build(punctuality_params)
		if params[:back]
	  		render :new
		else
			if @plaint.save
				Punctuality.find_by(id:@plaint.id).update(date:DateTime.now.to_date)
				redirect_to punctualities_path, notice: "plaint save!"
			else
				render :new
			end
		end
	end

	private

	def punctuality_params
		params.require(:punctuality).permit(:arrival_time, :departure_time)
	end
end
