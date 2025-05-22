FactoryBot.define do
  factory :authorization do
    user
    operation
    resource
    # is_visible { true }
  end
end
