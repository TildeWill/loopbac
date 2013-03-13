module Google
  class Photo
    def self.find(login)
      Google::Client.make_request(:get,
         "https://www.google.com/m8/feeds/photos/profile/loopb.ac/#{login}?xoauth_requestor_id=will@loopb.ac",
         "3.0")
    end
  end
end