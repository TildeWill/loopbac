module OmniAuthHelper
  def login_as(user)
    OmniAuth.config.mock_auth[:google_apps] = OmniAuth::AuthHash.new(
      "provider" => 'google_apps',
      "uid" => user.uid,
      "info" => {
        'first_name' => user.first_name,
        'last_name' => user.last_name,
        'name' => user.name,
        'email' => user.email
      }
    )
  end
end

RSpec.configure do |config|
  config.include(OmniAuthHelper, type: :feature)

  config.before(:each, type: :feature) do
    OmniAuth.config.test_mode = true
  end
end