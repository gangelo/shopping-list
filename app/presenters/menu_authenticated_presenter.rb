# frozen_string_literal: true

class MenuAuthenticatedPresenter < Presenter
  include Presentable

  def shopping_lists_css_class
    # TODO: If on the #index view for shopping lists
    'text-secondary'
    # else
    #   nil
    # end
  end

  def name
    'MenuAuthenticated'
  end

  def to_partial_path
    name.underscore
  end
end
