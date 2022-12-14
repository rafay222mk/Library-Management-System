# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pagy::Backend
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Catch all CanCan errors and alert the user of the exception
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name,:email,:password,:current_password,:role,:image, addresses_attributes: [ :_destroy, :address1 ,:address2, :zipcode, :city, :state, :country] ] )
    # debugger
    devise_parameter_sanitizer.permit(:account_update, keys: [:user_name,:email,:password,:current_password,:role,:image, addresses_attributes: [ :_destroy, :address1 ,:address2, :zipcode, :city, :state, :country] ] )
  end
end
