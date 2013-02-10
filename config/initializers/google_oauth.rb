ENV['CLIENT_ID'] ||= "205817886325.apps.googleusercontent.com"
ENV['CLIENT_SECRET'] ||= "56wS44B-Lho9bvHixMIEKf37"

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['CLIENT_ID'], ENV['CLIENT_SECRET']
end

OmniAuth.config.on_failure = Proc.new { |env|
  OmniAuth::FailureEndpoint.new(env).redirect_to_failure
}