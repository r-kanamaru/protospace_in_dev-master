class CommentsController < ApplicationController

  def new
    set_prototype
    @comment = Comment.new
  end

  def create
    set_prototype
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to "/prototypes/#{@prototype.id}", notice: 'New prototype was successfully created'
    else
      redirect_to "/prototypes/#{@prototype.id}/comments/new", alert: 'YNew prototype was unsuccessfully created'
    end
  end

  def edit
    set_prototype
    set_comment
  end

  def update
    set_prototype
    set_comment
    @comment.update(comment_params)
    redirect_to "/prototypes/#{@prototype.id}"
  end

  def destroy
    set_prototype
    set_comment
    if @comment.user_id == current_user.id
      @comment.destroy
      redirect_to "/prototypes/#{@prototype.id}"
    end
  end

  private

  def set_prototype
    @prototype = Prototype.find(params[:prototype_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:comment).merge(prototype_id: params[:prototype_id], user_id: current_user.id)
  end
end
