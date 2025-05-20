require 'rails_helper'

RSpec.describe "actions/edit", type: :view do
  let(:action) {
    Action.create!()
  }

  before(:each) do
    assign(:action, action)
  end

  it "renders the edit action form" do
    render

    assert_select "form[action=?][method=?]", action_path(action), "post" do
    end
  end
end
