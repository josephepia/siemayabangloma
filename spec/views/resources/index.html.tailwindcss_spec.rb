require 'rails_helper'

RSpec.describe "resources/index", type: :view do
  before(:each) do
    assign(:resources, [
      create(:resource),
      create(:resource)
    ])
  end

  it "renders a list of resources" do
    render
    cell_selector = 'div>p'
  end
end
