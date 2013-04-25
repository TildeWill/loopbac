require 'spec_helper'

describe NotesController do
  include AuthenticatedController

  describe '#index' do
    it "assigns only the current user's notes" do
      included_note = create(:note, author: current_user)
      excluded_note = create(:note)
      get :index
      assigns[:notes].should include(included_note)
      assigns[:notes].should_not include(excluded_note)
    end
  end

  describe '#create' do
    it "associates the current user as the owner of the note" do
      post :create, note: attributes_for(:note).merge(subject_id: create(:user).id)
      Note.last.author.should == current_user
    end
  end
end