require 'rails_helper'

RSpec.describe "operations/edit", type: :view do
  let(:operation) {
    Operation.create!()
  }

  before(:each) do
    assign(:operation, operation)
  end

  it "renders the edit operation form" do
    render

    assert_select "form[action=?][method=?]", operation_path(operation), "post" do
    end
  end
end
