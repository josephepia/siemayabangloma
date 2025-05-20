require 'rails_helper'

RSpec.describe "privileges/show", type: :view do
  before(:each) do
    assign(:privilege, Privilege.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
