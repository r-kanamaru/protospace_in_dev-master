class CommentsController < ApplicationController

  def new
    set_prototype
    @comment = Comment.new
  end

  def create
    set_prototype
    @comment = @prototype.comments.build(comment_params)
    if @comment.save
      render :show
    else
      render :new
    end
  end

  def edit
    set_prototype
    set_comment
  end

  def update
    set_prototype
    set_comment
    if @comment.update(comment_params)
      render :show
    else
      render :edit
    end
  end

  def destroy
    set_prototype
    set_comment
    @comment.destroy
    render :index
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
