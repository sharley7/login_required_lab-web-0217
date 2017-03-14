class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    session[:name]
  end

  def index
    if session[:name]
      @name = session[:name]
      render :index
    else
      redirect_to '/login'
    end
  end

  private

  def require_login
    redirect_to '/login' unless current_user
end

end
