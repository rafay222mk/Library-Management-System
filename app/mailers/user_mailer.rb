# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def send_welcome(user)
    # debugger
    create_reset_password_token(user)
    @user = user
    mail to: user.email, subject: 'Welcome to the site'
  end
  private
  def create_reset_password_token(user)
    raw, hashed = Devise.token_generator.generate(User, :reset_password_token)
    @token = raw
    user.reset_password_token = hashed
    user.reset_password_sent_at = Time.now.utc
    user.save
  end
end
