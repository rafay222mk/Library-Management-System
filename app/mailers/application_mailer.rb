# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'lib222management@gmail.com'
  layout 'mailer'
end
