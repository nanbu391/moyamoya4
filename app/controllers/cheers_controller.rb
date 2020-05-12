class CheersController < ApplicationController
  def create
    @cheer = current_user.cheers.create(post_id: params[:post_id])
    redirect_back(fallback_location: post_path(params[:post_id]))
  end

  def destroy
    @cheer = Cheer.find_by(post_id: params[:post_id], user_id: current_user.id)
    @cheer.destroy
    redirect_back(fallback_location: post_path(params[:post_id]))
  end
end
