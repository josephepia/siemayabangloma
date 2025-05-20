require 'rails_helper'

RSpec.describe "actions/show", type: :view do
  before(:each) do
    assign(:action, Action.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
