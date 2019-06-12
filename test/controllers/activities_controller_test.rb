require 'test_helper'

class ActivitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @activity = activities(:one)
  end


  # Create a draft
  test "should create a draft for activity" do
    assert_nil @activity.draft
    patch activity_url(@activity), params: { activity: { description: 'New Description', name: @activity.name }, commit: "Draft" }
    assert_redirected_to activity_url(@activity)
    activity = Activity.last
    refute_nil activity.draft
  end

  test "should update activity from draft" do
    # Creating a draft
    assert_nil @activity.draft
    patch activity_url(@activity), params: { activity: { description: 'New Description', name: @activity.name }, commit: "Draft" }
    assert_redirected_to activity_url(@activity)
    activity = Activity.last
    refute_nil activity.draft

    # Updating an activity from a draft
    patch activity_path(activity), params: { activity: { description: 'New Description', name: @activity.name }, commit: "Publish" }
    assert_redirected_to activity_url(@activity)
    activity2 = Activity.last
    assert_nil activity2.draft
  end

  test "should get index" do
    get activities_url
    assert_response :success
  end

  test "should get new" do
    get new_activity_url
    assert_response :success
  end

  test "should create activity" do
    assert_difference('Activity.count') do
      post activities_url, params: { activity: { description: @activity.description, name: @activity.name } }
    end

    assert_redirected_to activity_url(Activity.last)
  end

  test "should show activity" do
    get activity_url(@activity)
    assert_response :success
  end

  test "should get edit" do
    get edit_activity_url(@activity)
    assert_response :success
  end

  test "should update activity" do
    patch activity_url(@activity), params: { activity: { description: @activity.description, name: @activity.name } }
    assert_redirected_to activity_url(@activity)
  end

  test "should destroy activity" do
    assert_difference('Activity.count', -1) do
      delete activity_url(@activity)
    end

    assert_redirected_to activities_url
  end
end
