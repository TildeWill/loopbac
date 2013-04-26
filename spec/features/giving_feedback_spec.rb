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
      Then the subject should receive the feedback in an email
      And we should both see the feedback on the site
    }

    using_session(:reviewer) do
      reviewer_logs_in
      give_feedback
      see_given_feedback
    end

    subject_receives_email

    using_session(:subject) do
      subject_logs_in
      see_received_feedback
    end
  end

  def stub_google_users
    @subject = create(:subject)
    Google::User.stub(:all).and_return([
      Google::User.new(login: @subject.email.split('@').first, first_name: @subject.first_name, last_name: @subject.last_name)
    ])
  end

  def reviewer_logs_in
    @author = create(:author)
    login_as(@author)
    visit "/"
  end

  def subject_logs_in
    login_as(@subject)
    visit "/"
  end

  def give_feedback
    within(".loops-nav") do
      click_link("Create New")
    end
    find(:xpath, "//input[@id='simple_feedback_subject_id']").set(@subject.id)
    fill_in "Details", with: "You did a great job running the IPM today."
    click_button "Send Feedback"
  end

  def see_given_feedback
    page.should have_content @subject.name
    page.should have_content "You did a great job running the IPM today."
  end

  def subject_receives_email
    email = ActionMailer::Base.deliveries.last
    email.should have_subject("#{@author.name} just gave you feedback")
    email.should deliver_to(@subject.email)
    email.should deliver_from("Loops <loops@loopb.ac>")
    email.should have_body_text(/You did a great job running the IPM today./)
  end

  def see_received_feedback
    within(".loops-nav") do
      click_link("Received")
    end
    page.should have_content @author.name
    page.should have_content "You did a great job running the IPM today."
  end
end