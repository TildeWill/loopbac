module Google
  class PlusPeople
    def self.find(login)
      fields = "cover/coverPhoto,image"
      response_body = Google::Client.make_request(:get, "https://www.googleapis.com/plus/v1/people/#{login}?fields=#{fields}&key=#{GOOGLE_APP_ID}", "3.0")
      JSON.parse(response_body)
    end
  end
end