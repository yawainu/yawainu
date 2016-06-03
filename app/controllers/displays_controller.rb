class DisplaysController < ApplicationController
  layout "admin_form"

  def edit
    @display = User.find(params[:id]).display
  end

  def update
    @display = User.find(params[:id]).display

    if @display.update(display_params)
      redirect_to user_info_path(params[:id]), notice: '更新しました'
    else
      render :edit
    end
  end


  private
    def display_params
      params.require(:display).permit(:cover, :gallery, :work, :contact)
    end
end
