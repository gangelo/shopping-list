module MenuPresenterConcern
  extend ActiveSupport::Concern

  included do
    # So that this occurs AFTER any authentication callbacks take place.
    # This is so that this method is not needlessly called if an
    # authentication redirect needs to take place.
    append_before_action :initialize_menu_presenter #, unless: -> { devise_controller? }
  end

  private

  def initialize_menu_presenter
    @menu_presenter =  MenuPresenter.new(view_context)
  end
end
