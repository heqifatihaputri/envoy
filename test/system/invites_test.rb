require "application_system_test_case"

class InvitesTest < ApplicationSystemTestCase
  setup do
    @invite = invites(:one)
  end

  test "visiting the index" do
    visit invites_url
    assert_selector "h1", text: "Invites"
  end

  test "creating a Invite" do
    visit invites_url
    click_on "New Invite"

    fill_in "Arrival", with: @invite.arrival
    fill_in "Email Visitor", with: @invite.email_visitor
    fill_in "Full Name", with: @invite.full_name
    fill_in "Host", with: @invite.host
    fill_in "Location", with: @invite.location_id
    fill_in "Private Notes", with: @invite.private_notes
    fill_in "Sign In Time", with: @invite.sign_in_time
    click_on "Create Invite"

    assert_text "Invite was successfully created"
    click_on "Back"
  end

  test "updating a Invite" do
    visit invites_url
    click_on "Edit", match: :first

    fill_in "Arrival", with: @invite.arrival
    fill_in "Email Visitor", with: @invite.email_visitor
    fill_in "Full Name", with: @invite.full_name
    fill_in "Host", with: @invite.host
    fill_in "Location", with: @invite.location_id
    fill_in "Private Notes", with: @invite.private_notes
    fill_in "Sign In Time", with: @invite.sign_in_time
    click_on "Update Invite"

    assert_text "Invite was successfully updated"
    click_on "Back"
  end

  test "destroying a Invite" do
    visit invites_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Invite was successfully destroyed"
  end
end
