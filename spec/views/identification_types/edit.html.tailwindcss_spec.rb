require 'rails_helper'

RSpec.describe "identification_types/edit", type: :view do
  let(:identification_type) {
    create(:identification_type)
  }

  before(:each) do
    assign(:identification_type, identification_type)
  end

  it "renders the edit identification_type form" do
    render

    assert_select "form[action=?][method=?]", identification_type_path(identification_type), "post" do
    end
  end
end
