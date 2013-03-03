#require 'rubygems'
#require 'sinatra'

#use Rack::Session::Cookie
#enable :sessions

require 'gapps_openid'
require 'rack/openid'

#use Rack::OpenID

CONSUMER_KEY = GOOGLE_APP_ID
CONSUMER_SECRET = GOOGLE_APP_SECRET

module Google
  class Calendar

    #helpers do
    #def require_authentication
    #  redirect '/login' unless authenticated?
    #end
    #
    #def authenticated?
    #  !session[:openid].nil?
    #end

    def url_for(path)
      url = request.scheme + "://"
      url << request.host

      scheme, port = request.scheme, request.port
      if scheme == "https" && port != 443 ||
          scheme == "http" && port != 80
        url << ":#{port}"
      end
      url << path
      url
    end

    #end

    #before do
    #  @openid = session[:openid]
    #  @user_attrs = session[:user_attributes]
    #end

    ## Clear the session
    #get '/logout' do
    #  session.clear
    #  redirect '/login'
    #end
    #
    ## Handle login form & navigation links from Google Apps
    #get '/login' do
    #  if params["openid_identifier"].nil?
    #    # No identifier, just render login form
    #    erb :login
    #  else
    #    # Have provider identifier, tell rack-openid to start OpenID process
    #    headers 'WWW-Authenticate' => Rack::OpenID.build_header(
    #        :identifier => params["openid_identifier"],
    #        :required => ["http://axschema.org/contact/email",
    #                      "http://axschema.org/namePerson/first",
    #                      "http://axschema.org/namePerson/last"],
    #        :return_to => url_for('/openid/complete'),
    #        :method => 'post'
    #    )
    #    halt 401, 'Authentication required.'
    #  end
    #end
    #
    ## Handle the response from the OpenID provider
    #post '/openid/complete' do
    #  resp = request.env["rack.openid.response"]
    #  if resp.status == :success
    #    session[:openid] = resp.display_identifier
    #    ax = OpenID::AX::FetchResponse.from_success_response(resp)
    #    session[:user_attributes] = {
    #        :email => ax.get_single("http://axschema.org/contact/email"),
    #        :first_name => ax.get_single("http://axschema.org/namePerson/first"),
    #        :last_name => ax.get_single("http://axschema.org/namePerson/last")
    #    }
    #    redirect '/cal'
    #  else
    #    "Error: #{resp.status}"
    #  end
    #end

    # Display upcoming calendar appointments
    def self.events(email)
      #require_authentication

      oauth_consumer = OAuth::Consumer.new(CONSUMER_KEY, CONSUMER_SECRET)
      access_token = OAuth::AccessToken.new(oauth_consumer)
      client = Google::Client.new(access_token, '2.0')
      feed = client.get('https://www.google.com/calendar/feeds/default/private/full', {
          'xoauth_requestor_id' => email,
          'orderby' => 'starttime',
          'singleevents' => 'true',
          'sortorder' => 'a',
          'start-min' => Time.now.strftime('%Y-%m-%dT%H:%M:%S')
      })
      throw :halt, [500, "Unable to query calendar feed"] if feed.nil?
      events = []
      feed.elements.each('//entry') do |entry|
        events << {
            :title => entry.elements["title"].text,
            :content => entry.elements["content"].text,
            :start_time => entry.elements["gd:when"].attribute("startTime").value,
            :end_time => entry.elements["gd:when"].attribute("endTime").value
        }
      end
    end

## Generate a manifest for this deployment
#get '/manifest.xml' do
#  content_type 'text/xml'
#  erb :manifest, :layout => false
#end

## Catch-all route
#get '/*' do
#  redirect '/cal'
#end

  end
end