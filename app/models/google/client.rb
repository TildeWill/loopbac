require 'oauth'
require 'rexml/document'

module Google
  class Client
    attr_accessor :version

    def self.get(base, query_parameters = {}, version = '2.0')
      response_body = get_raw(base, query_parameters, version)
      REXML::Document.new(response_body)
    end

    def self.get_raw(base, query_parameters = {}, version = '2.0')
      make_request(:get, url(base, query_parameters), version)
    end

    def self.make_request(method, url, version)
      oauth_consumer = OAuth::Consumer.new(GOOGLE_APP_ID, GOOGLE_APP_SECRET)
      access_token = OAuth::AccessToken.new(oauth_consumer)

      response = access_token.request(method, url, {'GData-Version' => version})
      if response.is_a?(Net::HTTPFound)
        return make_request(method, response['Location'], version)
      end
      throw :halt, [500, "Unable to query feed"] unless response.is_a?(Net::HTTPSuccess)

      response.body
    end

    private

    def self.url(base, query_parameters={})
      url = base
      unless query_parameters.empty?
        url += '?'
        query_parameters.each { |key, value| url += "#{CGI::escape(key)}=#{CGI::escape(value)}&" }
        url.chop!
      end
      url
    end
  end
end