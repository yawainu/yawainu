class WorksController < ApplicationController
  before_action :set_user

  def index
    @works = @user.works
  end

  def new
    @work  = @user.works.build
  end

  def edit
    @work = @user.works.find(params[:id])
  end

  def create

    if @work = @user.works.create(work_params)
      redirect_to action: :index, notice: '更新しました'
    else
      render :new
    end
  end

  def update
    @work = @user.works.find(params[:id])

    if @work.update(work_params)
      redirect_to action: :index, notice: '更新しました'
    else
      render :edit
    end
  end

  def destroy
    @work = @user.works.find(params[:id])
    @work.destroy
    redirect_to user_works_path(params[:user_id])
  end


  private
    def work_params
      params.require(:work).permit(:start_date, :end_date, :comment, :app_flag)
    end
end
