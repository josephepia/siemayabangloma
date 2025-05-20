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
end
