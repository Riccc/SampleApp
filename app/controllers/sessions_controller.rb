class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      #登录用户，跳转到资料页面
      log_in user
      redirect_to user
    else
      #创建一个错误消息
      flash.now[:danger] = 'Invalid email/password combination'
      render "new"
    end
  end

  def destroy
  end
end
