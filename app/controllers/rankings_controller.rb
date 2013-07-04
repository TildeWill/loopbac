class RankingsController < ApplicationController
  def index
    @rankings = current_user.rankings.order(:position)
  end

  def sort
    params[:ranking].each_with_index do |id, index|
      Ranking.update_all({position: index+1}, {id: id})
    end
    render :nothing => true
  end
end