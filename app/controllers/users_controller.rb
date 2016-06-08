class UsersController < ApplicationController
  skip_before_filter :require_login, only: [:show, :new, :create]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users/1
  def show
    # ユーザごとのポートフォリオ
    @user_info = @user.user_info
    @display   = @user.display
    @cover     = @user.cover
    @categories= @user.categories
    @work      = @user.works

    render :layout => 'portforio'
  end

  # GET /users/new
  def new
    # 新規登録画面
    @user = User.new
    render :layout => 'admin_form'
  end

  # GET /users/1/edit
  def edit
    # 編集画面
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save

      # Userと1:1なので空を作っておく
      @user.create_cover()
      @user.create_display()
      @user.create_user_info()

      redirect_to(user_info_path(@user), notice: 'User was successfully created.')
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
