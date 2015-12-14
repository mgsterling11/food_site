class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :login_required
  helper_method :logged_in?, :current_user
  
  private
     def admin_required
      if !current_user.admin
        redirect_to recipes_path
      end
    end

    def login_required
      if !logged_in?
        redirect_to login_path, :notice => "You need to login"
      end
    end

    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= find_user_or_set_guest
    end

    def find_user_or_set_guest
      if session[:user_id]
        User.find(session[:user_id]) 
      else
        Guest.new
      end
    end
end
