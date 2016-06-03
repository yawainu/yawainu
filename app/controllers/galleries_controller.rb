class GalleriesController < ApplicationController
  layout "admin_form"

  def index
    @category  = User.find(params[:user_id]).categories.find(params[:category_id])
    @galleries = @category.galleries
  end

  def new
    @user      = User.find(params[:user_id])
    @category  = @user.categories.find(params[:category_id])
    @galleries = @category.galleries.build
  end

  def edit
    @user      = User.find(params[:user_id])
    @category  = @user.categories.find(params[:category_id])
    @galleries = @category.galleries.find(params[:id])
  end

  def create
    @category  = User.find(params[:user_id]).categories.find(params[:category_id])

    if @galleries = @category.galleries.create(gallery_params)
      redirect_to action: :index, notice: '更新しました'
    else
      render :new
    end
  end

  def update
    @category  = User.find(params[:user_id]).categories.find(params[:category_id])
    @galleries = @category.galleries.find(params[:id])

    if @galleries.update(gallery_params)
      redirect_to action: :index, notice: '更新しました'
    else
      render :edit
    end
  end

  def destroy
    @category  = User.find(params[:user_id]).categories.find(params[:category_id])
    @galleries = @category.galleries.find(params[:id])
    @galleries.destroy
    redirect_to action: :index
  end


  private
    def gallery_params
      params.require(:gallery).permit(:title, :app_flag, :image)
    end
end
