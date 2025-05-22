require "application_system_test_case"

class PrivilegesTest < ApplicationSystemTestCase
  setup do
    @privilege = privileges(:one)
  end

  test "visiting the index" do
    visit privileges_url
    assert_selector "h1", text: "Privileges"
  end

  test "should create privilege" do
    visit privileges_url
    click_on "New privilege"

    fill_in "Action", with: @privilege.operation_id
    fill_in "Permission", with: @privilege.permission_id
    fill_in "Resource", with: @privilege.resource_id
    click_on "Create Privilege"

    assert_text "Privilege was successfully created"
    click_on "Back"
  end

  test "should update Privilege" do
    visit privilege_url(@privilege)
    click_on "Edit this privilege", match: :first

    fill_in "Action", with: @privilege.operation_id
    fill_in "Permission", with: @privilege.permission_id
    fill_in "Resource", with: @privilege.resource_id
    click_on "Update Privilege"

    assert_text "Privilege was successfully updated"
    click_on "Back"
  end

  test "should destroy Privilege" do
    visit privilege_url(@privilege)
    click_on "Destroy this privilege", match: :first

    assert_text "Privilege was successfully destroyed"
  end
end
