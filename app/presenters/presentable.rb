# frozen_string_literal: true

module Presentable
  def name
    # e.g. 'UserMenu', 'AdminMenu', etc.
    raise NotImplementedError
  end

  def to_partial_path
    # e.g. "shared/#{name.downcase}", "shared/#{name.underscore}", etc.
    raise NotImplementedError
  end
end
