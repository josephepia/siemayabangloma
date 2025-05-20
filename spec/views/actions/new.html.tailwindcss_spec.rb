require 'rails_helper'

RSpec.describe "actions/new", type: :view do
  before(:each) do
    assign(:action, Action.new())
  end

  it "renders new action form" do
    render

    assert_select "form[action=?][method=?]", actions_path, "post" do
    end
  end
end
