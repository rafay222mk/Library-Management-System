# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Catch all CanCan errors and alert the user of the exception
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[user_name email password current_password role image ])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[user_name email password current_password role image ] )
  end
end
