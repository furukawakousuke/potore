class Public::RelationshipsController < ApplicationController
  before_action :authenticate_poster!
  
  def create
    current_poster.follow(params[:poster_id])
    redirect_to request.referer
  end
  # フォロー外すとき
  def destroy
    current_poster.unfollow(params[:poster_id])
    redirect_to request.referer
  end
  
  def followings
    poster = Poster.find(params[:poster_id])
    @posters = poster.followers
  end

  def followers
    poster = Poster.find(params[:poster_id])
    @posters = poster.followings
  end
end
