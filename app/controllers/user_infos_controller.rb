class UserInfosController < ApplicationController
  before_action :set_user

  def show
    # admin画面
    @user_info = @user.user_info
  end

  def edit
    # ユーザ情報編集
    @user_info = @user.user_info
  end

  def update
    @user_info = @user.user_info

    if @user_info.update(user_info_params)
      redirect_to user_info_path(params[:id]), notice: '更新しました'
    else
      render :edit
    end
  end


  private
    def user_info_params
      params.require(:user_info).permit(:comment, :main_color, :sub_color, :image)
    end
end
