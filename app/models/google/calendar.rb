module Google
  class Calendar
    attr_accessor :title, :content, :start_time, :end_time

    def self.events(email, start_time = nil)
      feed = Google::Client.get('https://www.google.com/calendar/feeds/default/private/full', {
          'xoauth_requestor_id' => email,
          'orderby' => 'starttime',
          'singleevents' => 'true',
          'sortorder' => 'a',
          'start-min' => start_time || Time.now.strftime('%Y-%m-%dT%H:%M:%S')
      })
      feed.elements.collect('//entry') do |entry|
        new(
            :title => entry.elements["title"].text,
            :content => entry.elements["content"].text,
            :start_time => DateTime.parse(entry.elements["gd:when"].attribute("startTime").value),
            :end_time => DateTime.parse(entry.elements["gd:when"].attribute("endTime").value)
        )
      end
    end

    def initialize(options = {})
      @title = options[:title]
      @content = options[:content]
      @start_time = options[:start_time]
      @end_time = options[:end_time]
    end
  end
end