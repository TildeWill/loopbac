require 'openid/store/filesystem'


Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_apps,
           :store => OpenID::Store::Filesystem.new('/tmp'),
           :name => 'google_apps',
           :identifier => 'https://www.google.com/accounts/o8/id'
end