# == Schema Information
#
# Table name: roles
#
#  id          :bigint           not null, primary key
#  description :string
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'rails_helper'

RSpec.describe Role, type: :model do
  describe "validations ActiveModel" do
    it { should validate_presence_of(:name) }
    # it { should validate_presence_of(:description) }
  end

  describe "associations" do
    it { should have_many(:users).through(:user_roles) }
    it { should have_many(:permissions).through(:role_permissions) }

  end
end
