require 'rails_helper'

RSpec.describe "identifications/edit", type: :view do
  let(:identification) {
    create(:identification)
  }

  before(:each) do
    assign(:identification, identification)
  end

  it "renders the edit identification form" do
    render

    assert_select "form[action=?][method=?]", identification_path(identification), "post" do
    end
  end
end
