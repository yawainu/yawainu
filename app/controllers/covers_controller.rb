class CoversController < ApplicationController
  before_action :set_user

  def edit
    @cover = @user.cover
  end

  def update
    @cover = @user.cover

    if @cover.update(cover_params)
      redirect_to user_info_path(params[:id]), notice: '更新しました'
    else
      render :edit
    end
  end


  private
    def cover_params
      params.require(:cover).permit(:image)
    end
end
