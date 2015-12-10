class UsersController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      set_session(@user)
      UserMailer.welcome_email(@user).deliver_now
      redirect_to recipes_path
    else
      render :new
    end
  end


  def show
    @user = User.find(params[:id])
  end
  
  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :public_profile)
    end

    def set_session(user)
      session[:user_id] = user.id
    end
end
