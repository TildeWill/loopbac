module Google
  class Photo
    def self.find(domain, login)
      Google::Client.get_raw("https://www.google.com/m8/feeds/photos/profile/#{domain}/#{login}", {}, '3.0')
    end
  end
end
