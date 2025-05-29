# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  address                :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  maternal_name          :string
#  middle_name            :string
#  paternal_name          :string
#  phone_number           :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :user_roles, dependent: :destroy
  has_many :roles, through: :user_roles
  has_many :authorizations
  has_many :resources, through: :authorizations
  has_many :operations, through: :authorizations
  has_many :identifications, inverse_of: :user, dependent: :destroy
  accepts_nested_attributes_for :identifications, allow_destroy: true

  # Validations
  validates :email, uniqueness: { case_sensitive: false }
  validates :first_name, presence: true
  validates :paternal_name, presence: true
  before_save { self.email = email.downcase }
  validates :identifications, length: { minimum: 1, message: "must have at least one identification" }, allow_blank: true
end
