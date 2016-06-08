class UserSessionsController < ApplicationController
  skip_before_filter :require_login, except: [:destroy]

  def new
    # ログイン画面
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password])
      redirect_to(user_info_path(@user), notice: 'Login successful')
    else
      flash.now[:alert] = 'Login failed'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to(login_path, notice: 'Logged out!')
  end
end
