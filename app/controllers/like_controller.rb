class LikeController < ApplicationController

  def vote
    @like = Like.new
    @like.story_id = params[:story_id]
    @like.value = params[:value]

    like = Like.where({story_id: params[:story_id], user_id: current_user.id})

    if current_user.nil?
      redirect_to signin_path, notice: 'kirjauduhan sisään'
    elsif like.any?
      redirect_to :back, notice: 'olet jo antanut äänesi'
    elsif @like.save
      current_user.likes << @like
      redirect_to :back, notice: 'äänestetty'
    else
      redirect_to :back
    end

  end
  private
    def like_params
      params.permit(:story_id, :value)
    end

end