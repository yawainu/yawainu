class ApplicationController < ActionController::Base
  before_filter :require_login

  # set_user
  def set_user
    id = 1
    id unless params[:id] == nil

    @user = User.find(id)
  end

  private
    def not_authenticated
      redirect_to login_path, alert: "Please login first"
    end
end
