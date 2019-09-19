require "application_system_test_case"

class EquivocalPlansTest < ApplicationSystemTestCase
  setup do
    @equivocal_plan = equivocal_plans(:one)
  end

  test "visiting the index" do
    visit equivocal_plans_url
    assert_selector "h1", text: "Equivocal Plans"
  end

  test "creating a Equivocal plan" do
    visit equivocal_plans_url
    click_on "New Equivocal Plan"

    fill_in "Canonical plan", with: @equivocal_plan.canonical_plan_id
    fill_in "Id", with: @equivocal_plan.id
    fill_in "Plan name", with: @equivocal_plan.plan_name
    click_on "Create Equivocal plan"

    assert_text "Equivocal plan was successfully created"
    click_on "Back"
  end

  test "updating a Equivocal plan" do
    visit equivocal_plans_url
    click_on "Edit", match: :first

    fill_in "Canonical plan", with: @equivocal_plan.canonical_plan_id
    fill_in "Id", with: @equivocal_plan.id
    fill_in "Plan name", with: @equivocal_plan.plan_name
    click_on "Update Equivocal plan"

    assert_text "Equivocal plan was successfully updated"
    click_on "Back"
  end

  test "destroying a Equivocal plan" do
    visit equivocal_plans_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Equivocal plan was successfully destroyed"
  end
end
