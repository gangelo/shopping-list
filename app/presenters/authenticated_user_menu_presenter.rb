# frozen_string_literal: true

class AuthenticatedUserMenuPresenter < Presenter
  include Presentable

  def name
    'AuthenticatedUserMenu'
  end

  def to_partial_path
    "shared/menu/#{name.underscore}"
  end
end
