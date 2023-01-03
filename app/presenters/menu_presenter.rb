# frozen_string_literal: true

class MenuPresenter < Presenter
  include Presentable

  def content
    if user_signed_in?
      MenuAuthenticatedPresenter.new(view_context)
    else
      MenuUnauthenticatedPresenter.new(view_context)
    end
  end
end
