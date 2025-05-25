# == Schema Information
#
# Table name: operations
#
#  id          :bigint           not null, primary key
#  description :string
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
FactoryBot.define do
  factory :operation do
    name { "create" }
  end
end
