# frozen_string_literal: true

class Presenter
  attr_reader :current_user

  def initialize(current_user)
    @current_user = current_user
  end

  def current_user?
    current_user.present?
  end

  private

  attr_writer :current_user
end
