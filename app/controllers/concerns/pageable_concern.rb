module PageableConcern
  extend ActiveSupport::Concern
  #before_action :initialize_pageable_model, only: :index

  def items_per_page
    # In case we want to make this customizable from the page later.
    params[:items_per_page] || Kaminari.config.default_per_page
  end

  private

  def page
    @page ||= params[:page]&.to_i || 1
  end

  # def initialize_pageable_model
  #   page = params[:page]&.to_i || 1

  #   # model = pageable_model

  #   # items = model.for_page(:title, page, items_per_page)
  #   # items = Kaminari.paginate_array(items, total_count: model.count).page(page).per(items_per_page)
  #   # @model = Presenter.for(items: items, current_user: current_user)
  #   @model = pageable_model.page(page).per(items_per_page)
  # end
end
