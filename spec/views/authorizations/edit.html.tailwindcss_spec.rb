require 'rails_helper'

RSpec.describe "authorizations/edit", type: :view do
  let(:authorization) {
    Authorization.create!()
  }

  before(:each) do
    assign(:authorization, authorization)
  end

  it "renders the edit authorization form" do
    render

    assert_select "form[action=?][method=?]", authorization_path(authorization), "post" do
    end
  end
end
