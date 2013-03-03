module Google
  class Contact
    attr_accessor :full_name, :first_name, :last_name, :email, :company, :title, :notes

    def self.all(email)
      feed = Google::Client.get("https://www.google.com/m8/feeds/contacts/default/full", {
          'xoauth_requestor_id' => email
      }, '3.0')

      feed.elements.collect('//entry') do |entry|
        new(
            :full_name => entry.elements["gd:name"].elements["gd:fullName"].text,
            :first_name => entry.elements["gd:name"].elements["gd:givenName"].text,
            :last_name => entry.elements["gd:name"].elements["gd:familyName"].text,
            :email => entry.elements["gd:email"].attribute("address").value,
            :company => entry.elements["gd:organization"].elements["gd:orgName"].text,
            :title => entry.elements["gd:organization"].elements["gd:orgTitle"].text,
            :notes => entry.elements["content"].text
        )
      end
    end

    def initialize(options = {})
      @full_name = options[:full_name]
      @first_name = options[:first_name]
      @last_name = options[:last_name]
      @email = options[:email]
      @company = options[:company]
      @title = options[:title]
      @notes = options[:notes]
    end
  end
end