module Google
  class Contact
    include Informal::Model
    attr_accessor :full_name, :email, :image_url

    def self.get_all(domain, authorization_token)
      transporter = GoogleApps::Transport.new(domain)
      #transporter.authenticate('will@loopb.ac', 'hats4HEADS')
      transporter.token = authorization_token
      users = transporter.get_users
      return [users]
    end

    def initialize(options)
      @full_name = options[:full_name]
      @email = options[:email]
      @image_url = options[:image_url]
    end
  end
end