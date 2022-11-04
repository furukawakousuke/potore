class Public::FavoritesController < ApplicationController
  before_action :authenticate_poster!
  
  
   #def favorites
  #favorite = Favorite.find(params[:poster_id])
   # @favorite = post_photo.favorites
  #end
  
  def create
    post_photo = PostPhoto.find(params[:post_photo_id])
    favorite = current_poster.favorites.new(post_photo_id: post_photo.id)
    favorite.save
    redirect_to post_photo_path(post_photo)
  end
  
  def destroy
     post_photo = PostPhoto.find(params[:post_photo_id])
    favorite = current_poster.favorites.find_by(post_photo_id: post_photo.id)
    favorite.destroy
    redirect_to post_photo_path(post_photo)
  end
end
