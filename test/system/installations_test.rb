require "application_system_test_case"

class InstallationsTest < ApplicationSystemTestCase
  setup do
    @installation = installations(:one)
  end

  test "visiting the index" do
    visit installations_url
    assert_selector "h1", text: "Installations"
  end

  test "creating a Installation" do
    visit installations_url
    click_on "New Installation"

    fill_in "Name", with: @installation.name
    fill_in "Sensor", with: @installation.sensor_id
    click_on "Create Installation"

    assert_text "Installation was successfully created"
    click_on "Back"
  end

  test "updating a Installation" do
    visit installations_url
    click_on "Edit", match: :first

    fill_in "Name", with: @installation.name
    fill_in "Sensor", with: @installation.sensor_id
    click_on "Update Installation"

    assert_text "Installation was successfully updated"
    click_on "Back"
  end

  test "destroying a Installation" do
    visit installations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Installation was successfully destroyed"
  end
end
