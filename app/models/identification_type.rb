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
class IdentificationType < ApplicationRecord
  # Validations
  validates :name, presence: true, uniqueness: true
  validates :abbreviation, presence: true, uniqueness: true
  # validates :description, presence: true

  # Associations
  has_many :identifications, dependent: :destroy
  has_many :users, through: :identifications

  # Scopes
  # scope :ordered_by_name, -> { order(:name) }
end
