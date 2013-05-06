require 'spec_helper'

module Google
  describe UserDecorator do
    describe "#to_autocomplete_json" do
      it 'returns a JSON object with value, label, and image' do
        contact = build_stubbed(:user, email: 'will@example.com', first_name: 'Will', last_name: 'Read')
        contact.stub(:id).and_return(523)
        decorated = UserDecorator.decorate(contact)
        decorated.to_autocomplete_json.should == {value: 523, label: "Will Read (will@example.com)", icon: '/photos/will'}.to_json
      end
    end
  end
end