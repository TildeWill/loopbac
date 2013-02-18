module Google
  class Contact
    include Informal::Model
    attr_accessor :full_name, :email, :image_url

    def self.get_all(domain, authorization_token)
      client = GoogleApps::Transport.new(domain, authorization_token)
      users = client.get_users
      return users
    end

    def initialize(options)
      @full_name = options[:full_name]
      @email = options[:email]
      @image_url = options[:image_url]
    end
  end
end