# frozen_string_literal: true

# The application controller.
class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :initialize_menu_presenter

  private

  def initialize_menu_presenter
    @menu_presenter =
      if current_user && user_signed_in?
        AuthenticatedUserMenuPresenter.new(current_user)
      else
        UnauthenticatedMenuPresenter.new unless devise_controller? || (current_user && user_signed_in?)
      end
  end
end
