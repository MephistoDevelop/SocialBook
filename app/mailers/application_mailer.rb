# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'max@example.com'
  layout 'mailer'
end
