class NotesController < ApplicationController
  def index
    @note = Note.new
    @notes = Note.all
  end

  def create
    @note = Note.create(params[:note])
    respond_with @note, location: notes_url
  end
end