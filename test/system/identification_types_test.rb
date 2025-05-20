require "application_system_test_case"

class IdentificationTypesTest < ApplicationSystemTestCase
  setup do
    @identification_type = identification_types(:one)
  end

  test "visiting the index" do
    visit identification_types_url
    assert_selector "h1", text: "Identification types"
  end

  test "should create identification type" do
    visit identification_types_url
    click_on "New identification type"

    fill_in "Name", with: @identification_type.name
    click_on "Create Identification type"

    assert_text "Identification type was successfully created"
    click_on "Back"
  end

  test "should update Identification type" do
    visit identification_type_url(@identification_type)
    click_on "Edit this identification type", match: :first

    fill_in "Name", with: @identification_type.name
    click_on "Update Identification type"

    assert_text "Identification type was successfully updated"
    click_on "Back"
  end

  test "should destroy Identification type" do
    visit identification_type_url(@identification_type)
    click_on "Destroy this identification type", match: :first

    assert_text "Identification type was successfully destroyed"
  end
end
