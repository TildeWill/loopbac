class NotesController < ApplicationController
  def new
    @note = Note.new
  end

  def index
    if params[:about] == "me"
      @notes = current_user.notes.where(:subject_id => current_user.id)
    else
      @notes = current_user.notes.includes(:subject).where("subject_id <> ?", current_user.id).order("users.name, notes.created_at DESC")
    end
  end

  def create
    @note = current_user.notes.create!(note_params)
    respond_with @note, location: notes_url
  end

  private

  def note_params
    params.require(:note).permit(:subject_id, :details)
  end
end