# frozen_string_literal: true

class MenuAuthenticatedPresenter < Presenter
  include Presentable

  # TODO: Add to anchor if on the shopping lists#index view
  def shopping_lists_css_class
    # if view_context.current_page?(view_context.shopping_lists_path)
    #   'text-secondary'
    # else
    'text-white'
    # end
  end

  # TODO: Add to anchor if on the items#index view
  def items_css_class
    # if view_context.current_page?(view_context.items_path)
    #   'text-secondary'
    # else
    'text-white'
    # end
  end

  # TODO: Add to anchor if on the stores#index view
  def stores_css_class
    # if view_context.current_page?(view_context.stores_path)
    #   'text-secondary'
    # else
    'text-white'
    # end
  end

  # TODO: Add to anchor if on the dashboard#index view
  def dashboard_css_class
    # if view_context.current_page?(view_context.dashboard_path)
    #   'text-secondary'
    # else
    'text-white'
    # end
  end
end
