# frozen_string_literal: true

class Presenter
  attr_reader :view_context

  delegate :controller, :current_user, :user_signed_in?, to: :view_context

  def initialize(view_context)
    @view_context = view_context
  end

  def current_user?
    current_user.present?
  end

  private

  attr_writer :view_context
end
