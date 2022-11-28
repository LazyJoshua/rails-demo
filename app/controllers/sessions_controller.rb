class SessionsController < ApplicationController

    def new
      
    end
  
    def create
      @user = User.find_by(username: params[:username], password: params[:password])
      if @user
        # session[:user_id] = @user.id
        signin_user @user
        # flash[:notice] = "登录成功"
        # redirect_to root_path
        render json: {
          status: 'ok',
          msg: {
            redirect_url: root_path
          }
        }
      else
        # flash[:notice] = "用户名或密码不正确"
        # render action: :new
        render json: {
          status: 'error',
          msg: "用户名或密码不正确"
        }
      end
    end
  
    def destroy
      # session[:user_id] = nil
      logout_user
      flash[:notice] = "退出成功"
      redirect_to root_path
    end
  end