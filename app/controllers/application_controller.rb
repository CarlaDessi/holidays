# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authorize
  protect_from_forgery with: :exception

  helper_method :admin_user, :current_user

  def admin_user
    @admin_user ||= User.find session[:user_id] if session[:user_id]
    if @admin_user.admin
      @admin_user
    end
  end

  def current_user
    @current_user ||= User.find session[:user_id] if session[:user_id]
    @current_user
  end

  protected

  def authorize
    unless User.find_by(id: session[:user_id])
      redirect_to login_url, notice: 'Please log in'
    end
  end

  def admin
    unless User.find_by(id: session[:user_id]).admin
      redirect_to '/'
    end
  end

end
