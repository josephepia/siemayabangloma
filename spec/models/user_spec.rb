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
require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build(:user) }
  # let(:user){ build(:user) }
  describe "validations ActiveModel" do
    # it { should validate_presence_of(:email) }
    # it { should validate_presence_of(:encrypted_password) }

    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:paternal_name) }
    # it { should validate_presence_of(:phone_number) }
    it { should validate_uniqueness_of(:email).case_insensitive }
  end

  describe "associations" do
    it { should have_many(:user_roles).dependent(:destroy) }
    it { should have_many(:roles).through(:user_roles) }
    it { should have_many(:authorizations) }
    it { should have_many(:resources).through(:authorizations) }
    it { should have_many(:operations).through(:authorizations) }
    it { should have_many(:identifications) }
  end
end
