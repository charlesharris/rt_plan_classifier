require 'test_helper'

class EquivocalPlansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @equivocal_plan = equivocal_plans(:one)
  end

  test "should get index" do
    get equivocal_plans_url
    assert_response :success
  end

  test "should get new" do
    get new_equivocal_plan_url
    assert_response :success
  end

  test "should create equivocal_plan" do
    assert_difference('EquivocalPlan.count') do
      post equivocal_plans_url, params: { equivocal_plan: { canonical_plan_id: @equivocal_plan.canonical_plan_id, id: @equivocal_plan.id, plan_name: @equivocal_plan.plan_name } }
    end

    assert_redirected_to equivocal_plan_url(EquivocalPlan.last)
  end

  test "should show equivocal_plan" do
    get equivocal_plan_url(@equivocal_plan)
    assert_response :success
  end

  test "should get edit" do
    get edit_equivocal_plan_url(@equivocal_plan)
    assert_response :success
  end

  test "should update equivocal_plan" do
    patch equivocal_plan_url(@equivocal_plan), params: { equivocal_plan: { canonical_plan_id: @equivocal_plan.canonical_plan_id, id: @equivocal_plan.id, plan_name: @equivocal_plan.plan_name } }
    assert_redirected_to equivocal_plan_url(@equivocal_plan)
  end

  test "should destroy equivocal_plan" do
    assert_difference('EquivocalPlan.count', -1) do
      delete equivocal_plan_url(@equivocal_plan)
    end

    assert_redirected_to equivocal_plans_url
  end
end
