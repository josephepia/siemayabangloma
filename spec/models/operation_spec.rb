# == Schema Information
#
# Table name: operations
#
#  id          :bigint           not null, primary key
#  description :string
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'rails_helper'

RSpec.describe Operation, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
