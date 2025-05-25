# == Schema Information
#
# Table name: resources
#
#  id          :bigint           not null, primary key
#  description :text
#  entity_type :string           not null
#  is_visible  :boolean          default(FALSE)
#  name        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_resources_on_entity_type  (entity_type) UNIQUE
#
class Resource < ApplicationRecord

    has_many :authorizations, dependent: :destroy
    has_many :privileges, dependent: :destroy
    has_many :operations, through: :privileges
    has_many :permissions, through: :privileges
    has_many :users, through: :authorizations

    # There are several ways to arrive at a third-degree table.
    has_many :authorizated_operations, through: :authorizations, source: :operation
    has_many :privileged_operations, through: :privileges, source: :operation
    has_many :authorizated_permissions, through: :authorizations, source: :permission
    

    validates :name, presence: true
    # validates :description, presence: true
    validates :entity_type, presence: true, uniqueness: true
    validates :is_visible, inclusion: { in: [true, false] }

    
end
