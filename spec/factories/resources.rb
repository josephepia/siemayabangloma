FactoryBot.define do
  factory :resource do
    sequence(:entity_type) { |n| "entity_type_#{n}" }
    sequence(:name) { |n| "Resource #{n}" }
    # name { "usuarios" }
    # entity_type { "users" }
  end
end
