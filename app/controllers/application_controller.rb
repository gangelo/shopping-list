# frozen_string_literal: true

# The application controller.
class ApplicationController < ActionController::Base
  before_action :authenticate_user!
end
