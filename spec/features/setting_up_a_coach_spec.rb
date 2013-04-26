require "spec_helper"

feature "Setting up a coach" do
  %Q{
    As an employee
    I must set up a coach before using the app
    So that I have someone to collaborate with
  }

  background do
    stub_google_users
  end

  scenario "Employee set up a coach for the first time" do
    %Q{
      Given I have no coach
      When log in
      Then I am prompted to connect with a coach
      And I select a coach
      And I can collaborate with her
    }

    new_employee_logs_in
    connect_with_coach
    view_coach_dashboard
  end

  def stub_google_users
    @coach = create(:coach)
    Google::User.stub(:all).and_return([
      Google::User.new(login: @coach.email.split('@').first, first_name: @coach.first_name, last_name: @coach.last_name)
    ])
  end

  def new_employee_logs_in
    @user = create(:user, :without_coach)
    login_as(@user)
    visit "/"
  end

  def connect_with_coach
    find(:xpath, "//input[@id='coach_relationship_coach_id']").set(@coach.id)
    click_button "Set My Coach"
    page.should have_content("Thanks for setting your coach!")
  end

  def view_coach_dashboard
    visit "/"
    click_link "My Coach"
    page.should have_content(@coach.name)
  end
end