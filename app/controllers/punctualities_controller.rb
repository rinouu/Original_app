class PunctualitiesController < ApplicationController
	skip_before_action :login_required, only: [:index, :new, :create]

	def index
		all_punctualities = Punctuality.user_punctuality_list(current_user.id)
		if params[:date]
			@punctualities = all_punctualities.date_search(params[:date]).page params[:page]
		else
			@punctualities = all_punctualities.page params[:page]
		end
	end

	def new
		@punctuality = Punctuality.new
	end

	def create
		@plaint = current_user.punctualities.build(punctuality_params)
		@plaint.date = DateTime.now.to_date
		if params[:back]
	  		render :new
		else
			if @plaint.save
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
