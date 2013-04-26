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
    create_a_note
    see_the_note
  end

  def stub_google_users
    @subject = create(:subject)
    Google::User.stub(:all).and_return([
      Google::User.new(login: @subject.email.split('@').first, first_name: @subject.first_name, last_name: @subject.last_name)
    ])
  end

  def employee_logs_in
    login_as(create(:user))
  end

  def create_a_note
    visit "/"
    within('.notes-nav') do
      click_link "Create New"
    end
    find(:xpath, "//input[@id='note_subject_id']").set(@subject.id)
    fill_in "Details", with: "She gave me ice cream."
    click_button "Save"
  end

  def see_the_note
    page.should have_content @subject.name
    page.should have_content "She gave me ice cream."
  end
end