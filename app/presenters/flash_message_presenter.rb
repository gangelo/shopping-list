# frozen_string_literal: true

class FlashMessagePresenter
  include Presentable

  TYPES = %i[alert notice]
  TYPE_CSS_CLASSES = {
    alert: 'alert-danger',
    notice: 'alert-success',
  }
  NOTICE_EXCLAIMATIONS = %w[Awesome! Yahoo! Yay! Yippie! :)]

  attr_reader :type

  def initialize(message, type:)
    raise "Unrecognized type \"#{type}\"" unless TYPES.include? type

    @message = message
    @type = type
  end

  class << self
    def collection(messages, type:)
      return [new(messages, type: type)] unless messages.respond_to? :map

      messages&.map { |message| new(message, type: type) } || []
    end
  end

  def message
    return @message unless type == :notice

    "#{notice_exclaimation} #{@message}"
  end

  def css_class
    @css_class ||= TYPE_CSS_CLASSES[type]
  end

  private

  def notice_exclaimation
    @notice_exclaimation ||= begin
      NOTICE_EXCLAIMATIONS[rand(0...NOTICE_EXCLAIMATIONS.length)]
    end
  end
end
