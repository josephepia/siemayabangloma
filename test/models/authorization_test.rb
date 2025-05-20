# == Schema Information
#
# Table name: authorizations
#
#  id           :bigint           not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  operation_id :bigint           not null
#  resource_id  :bigint           not null
#  user_id      :bigint           not null
#
# Indexes
#
#  index_authorizations_on_operation_id  (operation_id)
#  index_authorizations_on_resource_id   (resource_id)
#  index_authorizations_on_user_id       (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (operation_id => operations.id)
#  fk_rails_...  (resource_id => resources.id)
#  fk_rails_...  (user_id => users.id)
#
require "test_helper"

class AuthorizationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
