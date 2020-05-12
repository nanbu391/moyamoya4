class EmpathesController < ApplicationController
  def create
    @empathy = current_user.empathys.create(post_id: params[:post_id])
    redirect_back(fallback_location: post_path(params[:post_id]))
  end

  def destroy
    @empathy = Empathy.find_by(post_id: params[:post_id], user_id: current_user.id)
    @empathy.destroy
    redirect_back(fallback_location: post_path(params[:post_id]))
  end
end
