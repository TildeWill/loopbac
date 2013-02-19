module Google
  class Contact
    def self.get_all(domain, authorization_token)
      client = GoogleApps::Transport.new(domain: domain, token: authorization_token)
      #client = GoogleApps::FeedClient.new(domain: domain, token: authorization_token)
      result = client.get_users
      p result
      result
    end
  end
end