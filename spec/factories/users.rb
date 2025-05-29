# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  address                :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  maternal_name          :string
#  middle_name            :string
#  paternal_name          :string
#  phone_number           :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
FactoryBot.define do
  factory :user do
    sequence(:email) { |n| Faker::Internet.unique.email(name: "user#{n}") }
    password { Faker::Internet.password(min_length: 8) }
    first_name { Faker::Name.first_name }
    paternal_name { Faker::Name.last_name }
  end
end
