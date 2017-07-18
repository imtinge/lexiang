class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def not_authenticated
    redirect_to login_path, alert: '访问本页面前请先登录！'
  end

end
