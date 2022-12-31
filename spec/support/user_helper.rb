# frozen_string_literal: true

module UserHelper
  def sign_in_user(user: nil)
    user = create(:user) unless user.presence
    sign_in user
    user
  end
end

RSpec.configure do |config|
  config.include UserHelper
end
