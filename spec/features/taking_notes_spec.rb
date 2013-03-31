require "spec_helper"

feature "Taking notes about peers" do
  %Q{
    As an employee
    I want to take daily notes about my peers
    So that I can remember what happened when I review them
  }

  background do
    stub_google_users
  end

  scenario "Employee records a note about a peer" do
    %Q{
      When I record a private note about an employee
      Then that note should be saved
    }

    employee_logs_in
    go_to_notes
    create_a_note
    see_the_note
  end

  def stub_google_users
    @peer = create(:user)
    Google::User.stub(:all).and_return([
      Google::User.new(login: @peer.email.split('@').first, first_name: @peer.first_name, last_name: @peer.last_name)
    ])
  end

  def employee_logs_in
    login_as(create(:user))
  end

  def go_to_notes
    visit "/"
    click_link "Notes"
  end

  def create_a_note
    fill_in "New Note About", with: @peer.name
    fill_in "Details", with: "She gave me ice cream."
    click_button "Save"
  end

  def see_the_note
    page.should have_content @peer.name
    page.should have_content "She gave me ice cream."
  end
end