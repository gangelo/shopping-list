# frozen_string_literal: true

class MenuUnauthenticatedPresenter < Presenter
  include Presentable

  def name
    'MenuUnauthenticated'
  end

  def to_partial_path
    name.underscore
  end
end
