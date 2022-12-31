# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    email { nil }
    password { nil }
    confirmation_token { FFaker::Random.rand(9_999_999_999) }
    confirmation_sent_at { Time.now.utc }
    confirmed_at { Time.now.utc }
    reset_password_token { nil }
    reset_password_sent_at { nil }
  end

  after(:build) do |user, evaluator|
    user.password = FFaker::Internet.password if evaluator.password.nil?

    user.email = "#{evaluator.first_name}.#{evaluator.last_name}@domain.com".downcase if evaluator.email.nil?
    user.confirmed_at = evaluator.confirmed_at
  end
end
