# frozen_string_literal: true

module Presentable
  def name
    # Simply returns the class name minus the "[p|P]resenter" suffix.
    @name ||= begin
      class_name = self.class.name
      if class_name =~ /Presenter\z/i
        class_name[/\A(.+)Presenter\z/i, 1]
      else
        class_name
      end
    end
  end

  # Override if this partial is shared and does not reside in 'views/application',
  # or, if this partial does not reside in the same folder as view consuming this
  # partial.
  def to_partial_path
    # e.g. "shared/#{name.downcase}", "shared/#{name.underscore}", etc.
    name.underscore
  end
end
