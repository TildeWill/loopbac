Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, GOOGLE_APP_ID, GOOGLE_APP_SECRET,
           {
              access_type: "offline",
              scope: 'https://apps-apis.google.com/a/feeds/user/,userinfo.email,userinfo.profile'
           }
end