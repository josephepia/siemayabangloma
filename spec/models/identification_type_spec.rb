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
require 'rails_helper'

RSpec.describe IdentificationType, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
