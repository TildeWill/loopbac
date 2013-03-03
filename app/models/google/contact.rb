module Google
  class Contact
    def self.all(email)
      oauth_consumer = OAuth::Consumer.new(GOOGLE_APP_ID, GOOGLE_APP_SECRET)
      access_token = OAuth::AccessToken.new(oauth_consumer)
      client = Google::Client.new(access_token, '3.0')
      feed = client.get("https://www.google.com/m8/feeds/contacts/default/full", {
          'xoauth_requestor_id' => email
      })
      throw :halt, [500, "Unable to query user feed"] if feed.nil?
      entries = []
      feed.elements.each('//entry') do |entry|
        entries << {
            :full_name => entry.elements["gd:name"].elements["gd:fullName"].text,
            :first_name => entry.elements["gd:name"].elements["gd:givenName"].text,
            :last_name => entry.elements["gd:name"].elements["gd:familyName"].text,
            :email => entry.elements["gd:email"].attribute("address").value,
            :company => entry.elements["gd:organization"].elements["gd:orgName"].text,
            :title => entry.elements["gd:organization"].elements["gd:orgTitle"].text,
            :notes => entry.elements["content"].text,
        }
      end
      entries
    end
  end
end