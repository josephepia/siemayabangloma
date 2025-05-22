FactoryBot.define do
  factory :identification_type do
    sequence(:name) { |n| "identification_type #{n}" }
  end
end
