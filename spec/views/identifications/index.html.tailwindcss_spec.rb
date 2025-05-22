require 'rails_helper'

RSpec.describe "identifications/index", type: :view do
  before(:each) do
    assign(:identifications, [
      create(:identification),
      create(:identification)
    ])
  end

  it "renders a list of identifications" do
    render
    cell_selector = 'div>p'
  end
end
