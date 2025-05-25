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
require 'rails_helper'

RSpec.describe Resource, type: :model do
  
  describe "validations ActiveModel" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:entity_type) }
    # it { should validate_presence_of(:is_visible) }
    # it { should validate_inclusion_of(:is_visible).in_array([true, false]) }
  end

  describe "validations ActiveRecord" do
    it { should validate_uniqueness_of(:entity_type) }
    # it { should validate_uniqueness_of(:name) }

    it { should have_many(:authorizations) }
    it { should have_many(:privileges) }
    it { should have_many(:operations).through(:privileges) }
    it { should have_many(:permissions).through(:privileges) }
    it { should have_many(:users).through(:authorizations) }

    # There are several ways to arrive at a third-degree table.
    it { should have_many(:authorizated_operations).through(:authorizations).source(:operation) }
    it { should have_many(:privileged_operations).through(:privileges).source(:operation) }



    
    

  end
end
