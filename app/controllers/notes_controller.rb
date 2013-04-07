class NotesController < ApplicationController
  def index
    @note = Note.new
    @notes = current_user.notes
  end

  def create
    @note = current_user.notes.create(note_params)
    respond_with @note, location: notes_url
  end

  private

  def note_params
    params.require(:note).permit(:about_email, :details)
  end
end