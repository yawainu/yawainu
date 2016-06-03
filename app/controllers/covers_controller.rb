class CoversController < ApplicationController
  layout "admin_form"

  def edit
    @cover = User.find(params[:id]).cover
  end

  def update
    @cover = User.find(params[:id]).cover

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
