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
class Role < ApplicationRecord
  # Validations
  validates :name, presence: true
  # validates :description, presence: true

  # Associations
  has_many :user_roles, dependent: :destroy
  has_many :role_permissions, dependent: :destroy
  has_many :users, through: :user_roles
  has_many :permissions, through: :role_permissions

end
