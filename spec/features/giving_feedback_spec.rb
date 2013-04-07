require "spec_helper"

feature "Giving Feedback" do
  %Q{
    As an employee
    I want to give feedback to my peer
    So that he can be a better employee
  }

  background do
    stub_google_users
  end

  scenario "Employee gives feedback" do
    %Q{
      When I give feedback to a peer
      Then we should both see the feedback on the site
    }

    using_session(:reviewer) do
      reviewer_logs_in
      go_to_feedback
      give_feedback
      see_given_feedback
    end

    using_session(:subject) do
      subject_logs_in
      go_to_feedback
      see_received_feedback
    end
  end

  def stub_google_users
    @peer = create(:user)
    Google::User.stub(:all).and_return([
      Google::User.new(login: @peer.email.split('@').first, first_name: @peer.first_name, last_name: @peer.last_name)
    ])
  end

  def reviewer_logs_in
    @reviewer = create(:user)
    login_as(@reviewer)
  end

  def subject_logs_in
    login_as(@peer)
  end

  def go_to_feedback
    visit "/"
    click_link "Feedback"
  end

  def give_feedback
    fill_in "Who is your feedback about?", with: @peer.email
    fill_in "Details", with: "You did a great job running the IPM today."
    click_button "Send Feedback"
  end

  def see_given_feedback
    within(".feedback-given") do
      page.should have_content @peer.email
      page.should have_content "You did a great job running the IPM today."
    end
  end

  def see_received_feedback
    within(".feedback-received") do
      page.should have_content @reviewer.name
      page.should have_content "You did a great job running the IPM today."
    end
  end
end