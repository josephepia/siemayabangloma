require 'rails_helper'

RSpec.describe "authorizations/show", type: :view do
  before(:each) do
    assign(:authorization, Authorization.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
