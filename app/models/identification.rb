# == Schema Information
#
# Table name: identifications
#
#  id                     :bigint           not null, primary key
#  number                 :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  identification_type_id :bigint           not null
#  user_id                :bigint           not null
#
# Indexes
#
#  index_identifications_on_identification_type_id  (identification_type_id)
#  index_identifications_on_user_id                 (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (identification_type_id => identification_types.id)
#  fk_rails_...  (user_id => users.id)
#
class Identification < ApplicationRecord
  belongs_to :user
  belongs_to :identification_type

  # Validations
  validates :number, presence: true, uniqueness: true
  validates :user_id, presence: true
  validates :identification_type_id, presence: true, uniqueness: { scope: :user_id }
end
