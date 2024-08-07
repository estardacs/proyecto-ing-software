FactoryBot.define do
  factory :notification do
    user { nil }
    message { "MyText" }
    read { false }
  end
end
