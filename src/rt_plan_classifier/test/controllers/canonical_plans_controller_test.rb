require 'test_helper'

class CanonicalPlansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @canonical_plan = canonical_plans(:one)
  end

  test "should get index" do
    get canonical_plans_url
    assert_response :success
  end

  test "should get new" do
    get new_canonical_plan_url
    assert_response :success
  end

  test "should create canonical_plan" do
    assert_difference('CanonicalPlan.count') do
      post canonical_plans_url, params: { canonical_plan: { id: @canonical_plan.id, plan_name: @canonical_plan.plan_name } }
    end

    assert_redirected_to canonical_plan_url(CanonicalPlan.last)
  end

  test "should show canonical_plan" do
    get canonical_plan_url(@canonical_plan)
    assert_response :success
  end

  test "should get edit" do
    get edit_canonical_plan_url(@canonical_plan)
    assert_response :success
  end

  test "should update canonical_plan" do
    patch canonical_plan_url(@canonical_plan), params: { canonical_plan: { id: @canonical_plan.id, plan_name: @canonical_plan.plan_name } }
    assert_redirected_to canonical_plan_url(@canonical_plan)
  end

  test "should destroy canonical_plan" do
    assert_difference('CanonicalPlan.count', -1) do
      delete canonical_plan_url(@canonical_plan)
    end

    assert_redirected_to canonical_plans_url
  end
end
