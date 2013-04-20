module Google
  class User
    attr_accessor :login, :first_name, :last_name, :domain

    def self.all(domain)
      feed = Google::Client.get("https://apps-apis.google.com/a/feeds/#{domain}/user/2.0", {
        'get' => 'all'
      })
      feed.elements.collect('//entry') { |e| new(attributes_from_entry(e).merge(domain: domain)) }
    end

    def self.find(domain, login)
      feed = Google::Client.get("https://apps-apis.google.com/a/feeds/#{domain}/user/2.0/#{login}", {})
      feed.elements.collect('//entry') { |e| new(attributes_from_entry(e).merge(domain: domain)) }
    end

    def initialize(options ={})
      @login = options[:login]
      @first_name = options[:first_name]
      @last_name = options[:last_name]
      @domain = options[:domain]
    end

    def email
      "#{login}@#{domain}"
    end

    def name
      "#{first_name} #{last_name}"
    end

    private

    def self.attributes_from_entry(entry)
      {
        :login => entry.elements["apps:login"].attribute("userName").value,
        :first_name => entry.elements["apps:name"].attribute("givenName").value,
        :last_name => entry.elements["apps:name"].attribute("familyName").value
      }
    end
  end
end