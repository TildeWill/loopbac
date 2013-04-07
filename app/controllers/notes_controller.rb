class NotesController < ApplicationController
  def index
    @note = Note.new
    @notes = current_user.notes
  end

  def create
    @note = current_user.notes.create(params[:note])
    respond_with @note, location: notes_url
  end
end