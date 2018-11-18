class LikesController < ApplicationController
  def create
    @like = Like.create(user_id: current_user.id, prototype_id: params[:prototype_id])
    @likes = Like.where(prototype_id: params[:prototype_id])
    @likes_count = @likes.count
    @test = params[:prototype_id]
    respond_to do |format|
      format.html
      format.json
    end
  end

  def destroy
    @like = current_user.likes.find_by(prototype_id: params[:prototype_id])
    @like.destroy
    @likes = Like.where(prototype_id: params[:prototype_id])
    @likes_count = @likes.count
    @prototype = Prototype.find(params[:prototype_id])
    respond_to do |format|
      format.html
      format.json
    end
  end
end
