require "application_system_test_case"

class CreatesTest < ApplicationSystemTestCase
  setup do
    @create = creates(:one)
  end

  test "visiting the index" do
    visit creates_url
    assert_selector "h1", text: "Creates"
  end

  test "creating a Create" do
    visit creates_url
    click_on "New Create"

    fill_in "Event", with: @create.Event
    fill_in "Description", with: @create.description
    fill_in "Location", with: @create.location
    fill_in "Title", with: @create.title
    click_on "Create Create"

    assert_text "Create was successfully created"
    click_on "Back"
  end

  test "updating a Create" do
    visit creates_url
    click_on "Edit", match: :first

    fill_in "Event", with: @create.Event
    fill_in "Description", with: @create.description
    fill_in "Location", with: @create.location
    fill_in "Title", with: @create.title
    click_on "Update Create"

    assert_text "Create was successfully updated"
    click_on "Back"
  end

  test "destroying a Create" do
    visit creates_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Create was successfully destroyed"
  end
end
