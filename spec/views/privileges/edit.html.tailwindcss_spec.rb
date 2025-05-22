require 'rails_helper'

RSpec.describe "privileges/edit", type: :view do
  let(:privilege) {
    create(:privilege)
  }

  before(:each) do
    assign(:privilege, privilege)
  end

  it "renders the edit privilege form" do
    render

    assert_select "form[action=?][method=?]", privilege_path(privilege), "post" do
    end
  end
end
