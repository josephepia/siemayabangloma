require "application_system_test_case"

class AuthorizationsTest < ApplicationSystemTestCase
  setup do
    @authorization = authorizations(:one)
  end

  test "visiting the index" do
    visit authorizations_url
    assert_selector "h1", text: "Authorizations"
  end

  test "should create authorization" do
    visit authorizations_url
    click_on "New authorization"

    fill_in "Action", with: @authorization.action_id
    fill_in "Resource", with: @authorization.resource_id
    fill_in "User", with: @authorization.user_id
    click_on "Create Authorization"

    assert_text "Authorization was successfully created"
    click_on "Back"
  end

  test "should update Authorization" do
    visit authorization_url(@authorization)
    click_on "Edit this authorization", match: :first

    fill_in "Action", with: @authorization.action_id
    fill_in "Resource", with: @authorization.resource_id
    fill_in "User", with: @authorization.user_id
    click_on "Update Authorization"

    assert_text "Authorization was successfully updated"
    click_on "Back"
  end

  test "should destroy Authorization" do
    visit authorization_url(@authorization)
    click_on "Destroy this authorization", match: :first

    assert_text "Authorization was successfully destroyed"
  end
end
