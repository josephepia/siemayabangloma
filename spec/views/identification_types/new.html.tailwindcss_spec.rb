require 'rails_helper'

RSpec.describe "identification_types/new", type: :view do
  before(:each) do
    assign(:identification_type, IdentificationType.new())
  end

  it "renders new identification_type form" do
    render

    assert_select "form[action=?][method=?]", identification_types_path, "post" do
    end
  end
end
