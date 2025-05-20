require 'rails_helper'

RSpec.describe "identifications/show", type: :view do
  before(:each) do
    assign(:identification, Identification.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
