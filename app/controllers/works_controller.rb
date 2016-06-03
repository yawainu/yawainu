class WorksController < ApplicationController
  layout "admin_form"

  def index
    @user  = User.find(params[:user_id])
    @works = @user.works
  end

  def new
    @user  = User.find(params[:user_id])
    @work  = @user.works.build
  end

  def edit
    @user = User.find(params[:user_id])
    @work = @user.works.find(params[:id])
  end

  def create
    @user = User.find(params[:user_id])

    if @work = @user.works.create(work_params)
      redirect_to action: :index, notice: '更新しました'
    else
      render :new
    end
  end

  def update
    @user = User.find(params[:user_id])
    @work = @user.works.find(params[:id])

    if @work.update(work_params)
      redirect_to action: :index, notice: '更新しました'
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @work = @user.works.find(params[:id])
    @work.destroy
    redirect_to user_works_path(params[:user_id])
  end


  private
    def work_params
      params.require(:work).permit(:start_date, :end_date, :comment, :app_flag)
    end
end
