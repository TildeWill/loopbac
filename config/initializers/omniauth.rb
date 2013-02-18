Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, GOOGLE_APP_ID, GOOGLE_APP_SECRET
end