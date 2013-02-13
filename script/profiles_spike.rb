#!/usr/bin/env ruby

require 'google/api_client'
client = Google::APIClient.new
plus = client.discovered_api('plus')

# Initialize OAuth 2.0 client
client.authorization.client_id = '205817886325.apps.googleusercontent.com'
client.authorization.client_secret = '56wS44B-Lho9bvHixMIEKf37'
client.authorization.redirect_uri = 'http://localhost:3000/users/auth/google_oauth2/callback'

client.authorization.scope = 'https://www.google.com/m8/feeds'

# Request authorization
redirect_uri = client.authorization.authorization_uri
system("open", redirect_uri.to_s)

puts "temporary access token:"
client.authorization.code = STDIN.gets
client.authorization.fetch_access_token!

access_token = client.authorization.access_token
system("open", "https://www.google.com/m8/feeds/contacts/will@pivotallabs.com/full?access_token=#{access_token}&v=3.0")