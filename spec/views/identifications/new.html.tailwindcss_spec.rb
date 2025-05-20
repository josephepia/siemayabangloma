require 'rails_helper'

RSpec.describe "identifications/new", type: :view do
  before(:each) do
    assign(:identification, Identification.new())
  end

  it "renders new identification form" do
    render

    assert_select "form[action=?][method=?]", identifications_path, "post" do
    end
  end
end
