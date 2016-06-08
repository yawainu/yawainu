class GalleriesController < ApplicationController
  before_action :set_user

  def index
    @category  = @user.categories.find(params[:category_id])
    @galleries = @category.galleries
  end

  def new
    @category  = @user.categories.find(params[:category_id])
    @galleries = @category.galleries.build
  end

  def edit
    @category  = @user.categories.find(params[:category_id])
    @galleries = @category.galleries.find(params[:id])
  end

  def create
    @category  = @user.categories.find(params[:category_id])

    if @galleries = @category.galleries.create(gallery_params)
      redirect_to action: :index, notice: '更新しました'
    else
      render :new
    end
  end

  def update
    @category  = @user.categories.find(params[:category_id])
    @galleries = @category.galleries.find(params[:id])

    if @galleries.update(gallery_params)
      redirect_to action: :index, notice: '更新しました'
    else
      render :edit
    end
  end

  def destroy
    @category  = @user.categories.find(params[:category_id])
    @galleries = @category.galleries.find(params[:id])
    @galleries.destroy
    redirect_to action: :index
  end


  private
    def gallery_params
      params.require(:gallery).permit(:title, :app_flag, :image)
    end
end
