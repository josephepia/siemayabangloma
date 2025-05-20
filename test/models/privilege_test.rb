# == Schema Information
#
# Table name: privileges
#
#  id            :bigint           not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  operation_id  :bigint           not null
#  permission_id :bigint           not null
#  resource_id   :bigint           not null
#
# Indexes
#
#  index_privileges_on_operation_id   (operation_id)
#  index_privileges_on_permission_id  (permission_id)
#  index_privileges_on_resource_id    (resource_id)
#
# Foreign Keys
#
#  fk_rails_...  (operation_id => operations.id)
#  fk_rails_...  (permission_id => permissions.id)
#  fk_rails_...  (resource_id => resources.id)
#
require "test_helper"

class PrivilegeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
