Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, "205817886325.apps.googleusercontent.com", "56wS44B-Lho9bvHixMIEKf37"
end

OmniAuth.config.on_failure = Proc.new { |env|
  OmniAuth::FailureEndpoint.new(env).redirect_to_failure
}