class ApplicationController < ActionController::Base

  include Pundit
  protect_from_forgery
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  before_action :configure_permitted_parameters, if: :devise_controller?

  private
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:type, :name])
    end

    def user_not_authorized
      flash[:warning] = 'You are not authorized to perform this action'
      redirect_to(request.referrer || root_path)
    end
end
