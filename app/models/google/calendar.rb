module Google
  class Calendar
    # Display upcoming calendar appointments
    def self.events(email)
      oauth_consumer = OAuth::Consumer.new(GOOGLE_APP_ID, GOOGLE_APP_SECRET)
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
      events
    end
  end
end