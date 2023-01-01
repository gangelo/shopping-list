# frozen_string_literal: true

# The application controller.
class ApplicationController < ActionController::Base
  include MenuPresenterConcern

  before_action :authenticate_user!
end
