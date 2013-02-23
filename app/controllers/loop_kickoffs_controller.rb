class LoopKickoffsController < ApplicationController
  respond_to :html

  def new
    @loop_kickoff = LoopKickoffDecorator.decorate(LoopKickoff.new)
  end

  def create
    @loop_kickoff = LoopKickoff.create(params[:loop_kickoff].merge(coach_email: current_user.email))
    respond_with @loop_kickoff, location: loops_path
  end
end