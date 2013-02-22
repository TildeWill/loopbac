require 'spec_helper'

module Google
  describe ContactDecorator do
    contact_class = Class.new do
      attr_reader :login, :first_name, :last_name

      def initialize(options)
        @first_name = options[:first_name]
        @last_name = options[:last_name]
        @login = options[:login]
      end
    end

    describe "#to_autocomplete_json" do
      it 'returns a JSON object with value, label, and image' do
        contact = contact_class.new(login: 'will', first_name: 'Will', last_name: 'Read')
        decorated = ContactDecorator.decorate(contact)
        decorated.to_autocomplete_json.should == {value: 'will', label: "Will Read", icon: '/assets/missing_profile.png'}.to_json
      end
    end
  end
end