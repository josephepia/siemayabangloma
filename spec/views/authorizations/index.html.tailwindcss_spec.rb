require 'rails_helper'

RSpec.describe "authorizations/index", type: :view do
  before(:each) do
    assign(:authorizations, [
      Authorization.create!(),
      Authorization.create!()
    ])
  end

  it "renders a list of authorizations" do
    render
    cell_selector = 'div>p'
  end
end
