# == Schema Information
#
# Table name: identification_types
#
#  id           :bigint           not null, primary key
#  abbreviation :string
#  description  :text
#  name         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_identification_types_on_name  (name) UNIQUE
#
FactoryBot.define do
  factory :identification_type do
    sequence(:name) { |n| "identification_type #{n}" }
  end
end
