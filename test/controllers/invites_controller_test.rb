require 'test_helper'

class InvitesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @invite = invites(:one)
  end

  test "should get index" do
    get invites_url
    assert_response :success
  end

  test "should get new" do
    get new_invite_url
    assert_response :success
  end

  test "should create invite" do
    assert_difference('Invite.count') do
      post invites_url, params: { invite: { arrival: @invite.arrival, email_visitor: @invite.email_visitor, full_name: @invite.full_name, host: @invite.host, location_id: @invite.location_id, private_notes: @invite.private_notes, sign_in_time: @invite.sign_in_time } }
    end

    assert_redirected_to invite_url(Invite.last)
  end

  test "should show invite" do
    get invite_url(@invite)
    assert_response :success
  end

  test "should get edit" do
    get edit_invite_url(@invite)
    assert_response :success
  end

  test "should update invite" do
    patch invite_url(@invite), params: { invite: { arrival: @invite.arrival, email_visitor: @invite.email_visitor, full_name: @invite.full_name, host: @invite.host, location_id: @invite.location_id, private_notes: @invite.private_notes, sign_in_time: @invite.sign_in_time } }
    assert_redirected_to invite_url(@invite)
  end

  test "should destroy invite" do
    assert_difference('Invite.count', -1) do
      delete invite_url(@invite)
    end

    assert_redirected_to invites_url
  end
end
