require "application_system_test_case"

class CanonicalPlansTest < ApplicationSystemTestCase
  setup do
    @canonical_plan = canonical_plans(:one)
  end

  test "visiting the index" do
    visit canonical_plans_url
    assert_selector "h1", text: "Canonical Plans"
  end

  test "creating a Canonical plan" do
    visit canonical_plans_url
    click_on "New Canonical Plan"

    fill_in "Id", with: @canonical_plan.id
    fill_in "Plan name", with: @canonical_plan.plan_name
    click_on "Create Canonical plan"

    assert_text "Canonical plan was successfully created"
    click_on "Back"
  end

  test "updating a Canonical plan" do
    visit canonical_plans_url
    click_on "Edit", match: :first

    fill_in "Id", with: @canonical_plan.id
    fill_in "Plan name", with: @canonical_plan.plan_name
    click_on "Update Canonical plan"

    assert_text "Canonical plan was successfully updated"
    click_on "Back"
  end

  test "destroying a Canonical plan" do
    visit canonical_plans_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Canonical plan was successfully destroyed"
  end
end
