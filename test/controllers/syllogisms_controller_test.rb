require 'test_helper'

class SyllogismsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @syllogism = syllogisms(:one)
  end

  test "should get index" do
    get syllogisms_url
    assert_response :success
  end

  test "should get new" do
    get new_syllogism_url
    assert_response :success
  end

  test "should create syllogism" do
    assert_difference('Syllogism.count') do
      post syllogisms_url, params: { syllogism: { author: @syllogism.author, conclusion: @syllogism.conclusion, known: @syllogism.known, premises: @syllogism.premises, title: @syllogism.title } }
    end

    assert_redirected_to syllogism_url(Syllogism.last)
  end

  # test "should show syllogism" do
  #   get syllogism_url(@syllogism)
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get edit_syllogism_url(@syllogism)
  #   assert_response :success
  # end

  test "should update syllogism" do
    patch syllogism_url(@syllogism), params: { syllogism: { author: @syllogism.author, conclusion: @syllogism.conclusion, known: @syllogism.known, premises: @syllogism.premises, title: @syllogism.title } }
    assert_redirected_to syllogism_url(@syllogism)
  end

  test "should destroy syllogism" do
    assert_difference('Syllogism.count', -1) do
      delete syllogism_url(@syllogism)
    end

    assert_redirected_to syllogisms_url
  end
end
