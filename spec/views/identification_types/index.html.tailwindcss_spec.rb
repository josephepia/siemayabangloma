require 'rails_helper'

RSpec.describe "identification_types/index", type: :view do
  before(:each) do
    assign(:identification_types, [
      IdentificationType.create!(),
      IdentificationType.create!()
    ])
  end

  it "renders a list of identification_types" do
    render
    cell_selector = 'div>p'
  end
end
