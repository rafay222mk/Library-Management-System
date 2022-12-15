# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def send_welcome(user)
    # debugger
    @user = user
    mail to: user.email, subject: 'Welcome to the site'
  end
end
