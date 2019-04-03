class ApplicationController < ActionController::Base
  before_action :authorize
  protect_from_forgery with: :exception

  protected

    def authorize
      unless User.find_by(id: session[:user_id])
        redirect_to login_url, notice: "Please log in"
      end
    end

    def admin
      unless User.find_by(id: session[:user_id]).admin
        redirect_to "/"
      end
    end

end
