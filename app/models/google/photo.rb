module Google
  class Photo
    def self.find(domain, login)
      #Google::Client.make_request(:get, "https://www.google.com/m8/feeds/photos/profile/#{domain}/#{login}", "3.0")
      Google::Client.make_request(:get, "https://www.google.com/m8/feeds/photos/media/#{login}%40#{domain}", '3.0')
    end
  end
end


#https://developers.google.com/accounts/docs/OAuth_ref#AccessToken

#GET REQUEST TOKEN
#GET /accounts/OAuthGetRequestToken?scope=https%3A%2F%2Fwww.google.com%2Fm8%2Ffeeds%2F HTTP/1.1
#Host: www.google.com
#Accept: */*
#Authorization: OAuth oauth_version=" 1.0 ", oauth_nonce=" d7e1c0311e35f82403b760a1cbe3da8f ", oauth_timestamp=" 1368506554 ", oauth_consumer_key=" 242614503855.apps.googleusercontent.com ", oauth_callback=" http%3 A%2 F%2 Fgooglecodesamples.com%2 Foauth_playground%2 Findex.php ", oauth_signature_method=" HMAC-SHA1 ", oauth_signature=" W5vfODn%2 B9MFPdy0%2 BBAzFNmB3TIk%3 D "
#
#HTTP/1.1 200 OK
#Content-Type: text/plain; charset=UTF-8
#Date: Tue, 14 May 2013 04:42:34 GMT
#Expires: Tue, 14 May 2013 04:42:34 GMT
#Cache-Control: private, max-age=0
#X-Content-Type-Options: nosniff
#X-XSS-Protection: 1; mode=block
#Content-Length: 118
#Server: GSE
#
#oauth_token=4%2F3FAYotcYVwZV2JatqshLb9BFFpcy&oauth_token_secret=ZIc8siSfgwV8iqO7MQkFrpYY&oauth_callback_confirmed=true

# THEN: REDIRECT & USER AUTHORIZES THE TOKEN

#GET ACCESS TOKEN
#POST /accounts/OAuthGetAccessToken HTTP/1.1
#Host: www.google.com
#Content-Type: application/x-www-form-urlencoded
#Authorization: OAuth
#oauth_consumer_key=" example.com ",
#oauth_token=" CKF50YzIHxCT85KMAg ",
#oauth_verifier=" fERNOO3NfWph90CPCeIutmFA ",
#oauth_signature_method=" RSA-SHA1 ",
#oauth_signature=" wOJIO9A2W5mFwDgiDvZbTSMK%2 FPY%3 D ",
#oauth_timestamp=" 137131200 ",
#oauth_nonce=" 4572616e48616 d6d65724c61686176 ",
#oauth_version=" 1.0

#GET THE PHOTO
#GET&https%3A%2F%2Fwww.google.com%2Fm8%2Ffeeds%2Fphotos%2Fprofile%2Floopb.ac%2Fian&oauth_consumer_key%3D242614503855.apps.googleusercontent.com%26oauth_nonce%3Ddce4c8363b8368114ba77573d4e91d3e%26oauth_signature_method%3DHMAC-SHA1%26oauth_timestamp%3D1367907409%26oauth_token%3D1%252F1v4vrvSizOS1cTaGqfBbJfpohiNIvT4IOvpJPSXMWAE%26oauth_version%3D1.0

#OR, BROKEN OUT:
#GET /m8/feeds/photos/profile/loopb.ac/ian HTTP/1.1
#Host: www.google.com
#Accept: */*
#Authorization: OAuth oauth_version=" 1.0 ", oauth_nonce=" dce4c8363b8368114ba77573d4e91d3e ", oauth_timestamp=" 1367907409 ", oauth_consumer_key=" 242614503855.apps.googleusercontent.com ", oauth_token=" 1%2 F1v4vrvSizOS1cTaGqfBbJfpohiNIvT4IOvpJPSXMWAE ", oauth_signature_method=" HMAC-SHA1 ", oauth_signature=" PXGDQOUTDE5RqqDtggL4UV3kB%2 Bc%3 D "
#Content-Type: application/atom+xml
#GData-Version: 3.0
#
#HTTP/1.1 404 Not Found
#Content-Type: text/html; charset=UTF-8
#Date: Tue, 07 May 2013 06:16:49 GMT
#Expires: Tue, 07 May 2013 06:16:49 GMT
#Cache-Control: private, max-age=0
#X-Content-Type-Options: nosniff
#X-Frame-Options: SAMEORIGIN
#X-XSS-Protection: 1; mode=block
#Server: GSE
#Transfer-Encoding: chunked
#
#Photo not found

#NOTE: oauth_token is the access token once an access token has been fetched
