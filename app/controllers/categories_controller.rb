class CategoriesController < ApplicationController
  layout "admin_form"

  def index
    @user  = User.find(params[:user_id])
    @categories = @user.categories
  end

  def new
    @user  = User.find(params[:user_id])
    @categories = @user.categories.build
  end

  def edit
    @user  = User.find(params[:user_id])
    @categories = @user.categories.find(params[:id])
  end

  def create
    @user = User.find(params[:user_id])

    if @categories = @user.categories.create(category_params)
      redirect_to action: :index, notice: '更新しました'
    else
      render :new
    end
  end

  def update
    @user = User.find(params[:user_id])
    @categories = @user.categories.find(params[:id])

    if @categories.update(category_params)
      redirect_to action: :index, notice: '更新しました'
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @categories = @user.categories.find(params[:id])
    @categories.destroy
    redirect_to user_categories_path(params[:user_id])
  end


  private
    def category_params
      params.require(:category).permit(:title, :app_flag)
    end
end
