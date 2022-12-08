# frozen_string_literal: true

class WelcomeController < ApplicationController
  def home
    @user = User.find(current_user.id)
  end
end
