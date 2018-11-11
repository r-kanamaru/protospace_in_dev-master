class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:show, :destroy]

  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
    @prototype.captured_images.build
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to :root, notice: 'New prototype was successfully created'
    else
      redirect_to new_prototype_path, alert: 'YNew prototype was unsuccessfully created'
    end
  end

  def edit
    set_prototype
    @prototype.captured_images.build
  end

  def update
    set_prototype
    @prototype.update(prototype_params)
    redirect_to prototype_path
  end

  def show
  end

  def destroy
    if @prototype.user_id == current_user.id
      @prototype.destroy
    end
  end

  private

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def prototype_params
    params.require(:prototype).permit(
      :title,
      :catch_copy,
      :concept,
      :user_id,
      captured_images_attributes: [:content, :status, :id]
    )
  end
end
