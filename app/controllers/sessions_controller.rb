class SessionsController < ApplicationController
  def create
    user = login(params[:session][:username], params[:session][:password], params[:session][:remember_me])
    if user
      redirect_to root_path, notice: '登陆成功！'
    else
      flash.now.alert = '用户名或密码错误！'
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: '退出成功！'
  end
end
