module Google
  class User
    attr_accessor :login, :first_name, :last_name
    def self.all(domain)
      oauth_consumer = OAuth::Consumer.new(GOOGLE_APP_ID, GOOGLE_APP_SECRET)
      access_token = OAuth::AccessToken.new(oauth_consumer)
      client = Google::Client.new(access_token, '2.0')
      feed = client.get("https://apps-apis.google.com/a/feeds/#{domain}/user/2.0", {
          'get' => 'all'
      })
      throw :halt, [500, "Unable to query user feed"] if feed.nil?
      entries = []
      feed.elements.each('//entry') do |entry|
        entries << new(
            :login => entry.elements["apps:login"].attribute("userName").value,
            :first_name => entry.elements["apps:name"].attribute("givenName").value,
            :last_name => entry.elements["apps:name"].attribute("familyName").value,
        )
      end
      entries
    end

    def self.find(domain, login)
      oauth_consumer = OAuth::Consumer.new(GOOGLE_APP_ID, GOOGLE_APP_SECRET)
      access_token = OAuth::AccessToken.new(oauth_consumer)
      client = Google::Client.new(access_token, '2.0')
      feed = client.get("https://apps-apis.google.com/a/feeds/#{domain}/user/2.0/#{login}", {})
      throw :halt, [500, "Unable to query user feed"] if feed.nil?
      entries = []
      feed.elements.each('//entry') do |entry|
        entries << new(
            :login => entry.elements["apps:login"].attribute("userName").value,
            :first_name => entry.elements["apps:name"].attribute("givenName").value,
            :last_name => entry.elements["apps:name"].attribute("familyName").value,
        )
      end
      entries
    end

    def initialize(options ={})
      @login = options[:login]
      @first_name = options[:first_name]
      @last_name = options[:last_name]
    end
  end
end