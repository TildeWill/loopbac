class CoachRelationshipsController < ApplicationController
  skip_before_filter :check_for_coach, only: [:new, :create]
  def new

  end

  def index

  end

  def create
    current_user.coach_id = coach_params[:coach_id]
    current_user.save
    respond_with current_user, location: coach_relationships_path
  end

  private
  def coach_params
    params.require(:coach_relationship).permit(:coach_id)
  end
end