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
require 'rails_helper'

RSpec.describe Identification, type: :model do
  describe 'validations' do
    subject { build(:identification) }

    it { should validate_presence_of(:number) }
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:identification_type_id) }
    it do
      should validate_uniqueness_of(:number).case_insensitive
    end
    # it { should validate_uniqueness_of(:number) }
    it do
      # let(:identification) { create(:identification) }
      should validate_uniqueness_of(:identification_type_id).scoped_to(:user_id)
    end
    # it { should validate_numericality_of(:number).only_integer }

  end
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:identification_type) }
  end

  describe 'validations ActiveRecord' do

    # DADO una identificacion
    # CUANDO se intenta crear con un numero, user_id e identification_type_id
    # ENTONCES deberia ser un registro exitoso
    it "should succes craete identification with user_id and identification_type_id and number" do
      user1 = create(:user)
      identification_type1 = create(:identification_type, name: "Tarjeta de identidad", abbreviation: "TI")
      identification1 = Identification.new(number: "1", identification_type_id: identification_type1.id, user_id: user1.id)

      expect(identification1).to be_valid
    end

    # DADO una identificacion
    # CUANDO se intenta crear sin un indentification_type
    # ENTONCES deberia ser un registro invalido
    it "couldn't success create identification without identification_type" do

      user = create(:user)

      identification1 = Identification.new(number: "1", user_id: user.id)

      expect(identification1).not_to be_valid
    end

    # DADO una identification
    # CUANDO se intenta crear sin in user_id
    # ENTONCES deberia ser un registro invalido

    it "couldn't success create identification without user_id" do
      identification_type1 = IdentificationType.create(name: "Tarjeta de identidad", abbreviation: "TI")
      identification1 = Identification.new(number: "1", identification_type_id: identification_type1.id)
      expect(identification1).not_to be_valid
    end

    # DADO una identification
    # CUANDO se intenta crear con un numero ya existente
    # ENTONCES deberia ser un registro invalido

    it "couldn't success create identification if number exist" do
      user = create(:user)

      identification_type1 = IdentificationType.create(name: "Tarjeta de identidad", abbreviation: "TI")
      identification_type2 = IdentificationType.create(name: "Cedula de ciudadania", abbreviation: "CC")
      identification1 = Identification.create(number: 1, user_id: user.id, identification_type_id: identification_type1.id)
      identification2 = Identification.create(number: 1, user_id: user.id, identification_type_id: identification_type2.id)

      expect(identification2).not_to be_valid
    end

    # DADO una identification
    # CUANDO se intenta asociar mas de 1 identification_type del mismo tipo al mismo  User
    # ENTONCES deberia ser un registro invalido

    it "couldn't success create identification if user have a identification_type" do
      user = create(:user)
      identification_type1 = IdentificationType.create(name: "Tarjeta de identidad", abbreviation: "TI")

      identification1 = Identification.create(number: 1, user_id: user.id, identification_type_id: identification_type1.id)
      identification2 = Identification.create(number: 2, user_id: user.id, identification_type_id: identification_type1.id)

      expect(identification2).not_to be_valid
    end


  end
end
