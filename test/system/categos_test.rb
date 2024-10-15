require "application_system_test_case"

class CategosTest < ApplicationSystemTestCase
  setup do
    @catego = categos(:one)
  end

  test "visiting the index" do
    visit categos_url
    assert_selector "h1", text: "Categos"
  end

  test "should create catego" do
    visit categos_url
    click_on "New catego"

    fill_in "Name", with: @catego.name
    click_on "Create Catego"

    assert_text "Catego was successfully created"
    click_on "Back"
  end

  test "should update Catego" do
    visit catego_url(@catego)
    click_on "Edit this catego", match: :first

    fill_in "Name", with: @catego.name
    click_on "Update Catego"

    assert_text "Catego was successfully updated"
    click_on "Back"
  end

  test "should destroy Catego" do
    visit catego_url(@catego)
    click_on "Destroy this catego", match: :first

    assert_text "Catego was successfully destroyed"
  end
end
