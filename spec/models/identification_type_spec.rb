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
  describe "validations ActiveModel" do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:abbreviation) }
    it { should validate_uniqueness_of(:abbreviation) }
    # it { should validate_presence_of(:description) }
    it { should validate_uniqueness_of(:name) }
  end

  describe "associations" do
    it { should have_many(:identifications).dependent(:destroy) }
    it { should have_many(:users).through(:identifications) }
  end

  describe "validattion activeRecord" do
    # DADO un tipo de identificacion
    # CUANDO se intenta crear con su nombre y abreviatura
    # ENTONCES deberia ser valido
    it "should success create indetifiaction_type with name and abbreviation" do
      identification_type1 = IdentificationType.new(name: "tarjeta de identidad", abbreviation: "TI")

      expect(identification_type1).to be_valid
    end

    # DADO un tipo de identificacion
    # CUANDO no se le proporciona un nombre
    # ENTONCES no es un registro valido
    it "couldn't success create without name" do
      identification_type1 = IdentificationType.new(abbreviation: "TI")

      expect(identification_type1).to_not be_valid
    end

    # DADO un tipo de identificacion
    # CUANDO se intenta crear sin abreviacion pero con nombre
    # ENTONCES no deberia ser un registro valido
    it "couldn't success create without abbreviation but with name" do
      identification_type1 = IdentificationType.new(name: "tarjeta de identidad")

      expect(identification_type1).to_not be_valid
    end

    # DADO un tipo de identificacion
    # CUANDO se intenta crear sin nombre pero con abreviacion
    # ENTONCES no deberia ser un registro valido
    it "couldn't success create without name but with abbreviation" do
      identification_type1 = IdentificationType.new(abbreviation: "TI")

      expect(identification_type1).to_not be_valid
    end

    # DADO un tupo de identificacion
    # CUANDO se intenta crear con un nombre que ya existe
    # ENTONCES no deberia ser un registro valido
    it "couldn't success create with existing name" do
      identification_type1 = IdentificationType.create(name: "tarjeta de identidad", abbreviation: "TI")
      identification_type2 = IdentificationType.new(name: "tarjeta de identidad", abbreviation: "TID")

      expect(identification_type1).to be_valid
      expect(identification_type2).to_not be_valid
    end

    # DADO un tipo de identificacion
    # CUANDO se intenta crear con una abreviacion que ya existe
    # ENTONCES no deberia ser un registro valido
    it "couldn't success create with existing abbreviation" do
      identification_type1 = IdentificationType.create(name: "tarjeta de identidad", abbreviation: "TI")
      identification_type2 = IdentificationType.new(name: "tarjeta de identidad nueva", abbreviation: "TI")

      expect(identification_type1).to be_valid
      expect(identification_type2).to_not be_valid
    end

  end
  # describe "scopes" do
  #   let!(:identification_type1) { create(:identification_type, name: 'Passport') }
  #   let!(:identification_type2) { create(:identification_type, name: 'Driver License') }
  #
  #   it "returns all identification types" do
  #     expect(IdentificationType.all).to match_array([identification_type1, identification_type2])
  #   end
  #
  #   it "returns identification types ordered by name" do
  #     expect(IdentificationType.order_by_name).to eq([identification_type1, identification_type2])
  #   end
  # end
end
