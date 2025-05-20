require 'rails_helper'

RSpec.describe "privileges/new", type: :view do
  before(:each) do
    assign(:privilege, Privilege.new())
  end

  it "renders new privilege form" do
    render

    assert_select "form[action=?][method=?]", privileges_path, "post" do
    end
  end
end
