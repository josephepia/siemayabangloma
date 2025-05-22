require "application_system_test_case"

class IdentificationsTest < ApplicationSystemTestCase
  setup do
    @identification = identifications(:one)
  end

  test "visiting the index" do
    visit identifications_url
    assert_selector "h1", text: "Identifications"
  end

  test "should create identification" do
    visit identifications_url
    click_on "New identification"

    fill_in "identification type", with: @identification.identification_type_id
    fill_in "Number", with: @identification.number
    fill_in "User", with: @identification.user_id
    click_on "Create Identification"

    assert_text "Identification was successfully created"
    click_on "Back"
  end

  test "should update Identification" do
    visit identification_url(@identification)
    click_on "Edit this identification", match: :first

    fill_in "identification type", with: @identification.identification_type_id
    fill_in "Number", with: @identification.number
    fill_in "User", with: @identification.user_id
    click_on "Update Identification"

    assert_text "Identification was successfully updated"
    click_on "Back"
  end

  test "should destroy Identification" do
    visit identification_url(@identification)
    click_on "Destroy this identification", match: :first

    assert_text "Identification was successfully destroyed"
  end
end
