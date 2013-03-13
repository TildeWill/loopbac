module Google
  class Profile
    attr_accessor :login, :first_name, :last_name
    def self.all(domain)
      feed = Google::Client.get("https://www.google.com/m8/feeds/profiles/domain/#{domain}/full", {
          'xoauth_requestor_id' => 'will@loopb.ac'
      }, "3.0")
      feed.elements.collect('//entry') { |e| new_from_entry(e) }
    end

    def self.find(domain, login)
      feed = Google::Client.get("https://apps-apis.google.com/a/feeds/#{domain}/user/2.0/#{login}", {})
      feed.elements.collect('//entry') { |e| new_from_entry(e) }
    end

    def initialize(options ={})
      @full_name = options[:title]
      @first_name = options[:first_name]
      @last_name = options[:last_name]
    end

    private

    def self.new_from_entry(entry)
      new(
          :title => entry.elements["title"].text,
          :first_name => entry.elements["gd:name"].elements["gd:givenName"].text,
          :last_name => entry.elements["gd:name"].elements["gd:familyName"].text,
          #:image => entry.elements["link[type=image/*]"].attribute("href").value,
      )
    end
  end
end