module Google
  class Contact
    def self.get_all(domain, authorization_token)
      client = GoogleAppsOauth2::Transport.new(domain: domain, token: authorization_token)
      client.get_users
    end
  end
end