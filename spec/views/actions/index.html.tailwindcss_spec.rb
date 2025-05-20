require 'rails_helper'

RSpec.describe "actions/index", type: :view do
  before(:each) do
    assign(:actions, [
      Action.create!(),
      Action.create!()
    ])
  end

  it "renders a list of actions" do
    render
    cell_selector = 'div>p'
  end
end
