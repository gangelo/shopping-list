# frozen_string_literal: true

class UnauthenticatedMenuPresenter
  include Presentable

  def name
    # e.g. 'UserMenu', 'AdminMenu', etc.
    'UnauthenticatedMenu'
  end

  def to_partial_path
    "shared/menu/#{name.underscore}"
  end
end
