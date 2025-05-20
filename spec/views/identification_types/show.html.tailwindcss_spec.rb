require 'rails_helper'

RSpec.describe "identification_types/show", type: :view do
  before(:each) do
    assign(:identification_type, IdentificationType.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
