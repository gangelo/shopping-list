# frozen_string_literal: true

# The base application mailer class.
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
