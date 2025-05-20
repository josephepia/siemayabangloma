require 'rails_helper'

RSpec.describe "identifications/index", type: :view do
  before(:each) do
    assign(:identifications, [
      Identification.create!(),
      Identification.create!()
    ])
  end

  it "renders a list of identifications" do
    render
    cell_selector = 'div>p'
  end
end
