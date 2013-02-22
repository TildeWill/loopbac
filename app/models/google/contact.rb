module Google
  class Contact
    def self.get_all(domain, token, refresh_token)
      client = GoogleAppsOauth2::Transport.new(domain: domain, token: token, client_id: GOOGLE_APP_ID, client_secret: GOOGLE_APP_SECRET, refresh_token: refresh_token)
      client.get_users
    end
  end
end