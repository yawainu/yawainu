class CategoriesController < ApplicationController
  before_action :set_user

  def index
    @categories = @user.categories
  end

  def new
    @categories = @user.categories.build
  end

  def edit
    @categories = @user.categories.find(params[:id])
  end

  def create
    if @categories = @user.categories.create(category_params)
      redirect_to action: :index, notice: '更新しました'
    else
      render :new
    end
  end

  def update
    @categories = @user.categories.find(params[:id])

    if @categories.update(category_params)
      redirect_to action: :index, notice: '更新しました'
    else
      render :edit
    end
  end

  def destroy
    @categories = @user.categories.find(params[:id])
    @categories.destroy
    redirect_to user_categories_path(params[:user_id])
  end


  private
    def category_params
      params.require(:category).permit(:title, :app_flag)
    end
end
