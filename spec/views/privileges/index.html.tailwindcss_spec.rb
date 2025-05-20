require 'rails_helper'

RSpec.describe "privileges/index", type: :view do
  before(:each) do
    assign(:privileges, [
      Privilege.create!(),
      Privilege.create!()
    ])
  end

  it "renders a list of privileges" do
    render
    cell_selector = 'div>p'
  end
end
