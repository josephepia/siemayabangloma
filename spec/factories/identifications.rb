# == Schema Information
#
# Table name: identifications
#
#  id                     :bigint           not null, primary key
#  number                 :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  identification_type_id :bigint           not null
#  user_id                :bigint           not null
#
# Indexes
#
#  index_identifications_on_identification_type_id  (identification_type_id)
#  index_identifications_on_user_id                 (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (identification_type_id => identification_types.id)
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :identification do
    sequence(:number) { |n| n }
    user
    identification_type
  end
end
