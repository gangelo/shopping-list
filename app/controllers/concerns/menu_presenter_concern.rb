# frozen_string_literal: true

module MenuPresenterConcern
  extend ActiveSupport::Concern

  included do
    # append_before_action...
    # So that this callback occurs AFTER any authentication callbacks take place.
    # This avoids calling #initialize_menu_presenter if an authentication redirect
    # needs to take place.
    append_before_action :initialize_menu_presenter
  end

  private

  def initialize_menu_presenter
    @menu_presenter = MenuPresenter.new(view_context)
  end
end
