class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	def current_user2
		@current_user ||= guest_user
	end

	private

	def guest_user
		User.find(session[:guest_user_id].nil? ? session[:guest_user_id] = create_guest_user.id : session[:guest_user_id])
	end

	def create_guest_user 
		u = User.create(:name => "guest", :email => "guest_#{Time.now.to_i}#{rand(99)}@dive.l", :password => "123456", :password_confirmation => "123456")
		u.save(:validate => false)
		u
	end

	protected

	def configure_permitted_parameters
	devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
	devise_parameter_sanitizer.permit(:account_update, keys: [:username])
	end
end
