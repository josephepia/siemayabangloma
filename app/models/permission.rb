# == Schema Information
#
# Table name: permissions
#
#  id          :bigint           not null, primary key
#  description :string
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Permission < ApplicationRecord
  has_many :role_permissions, dependent: :destroy
  has_many :roles, through: :role_permissions
  has_many :privileges
  has_many :resources, through: :privileges
  has_many :operations, through: :privileges


end
