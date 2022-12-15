class WelcomeController < ApplicationController
  def index
    # session[:user_id] = nil
    @user = if session[:user_id]
      User.find session[:user_id]
    else
      nil
    end

    # redirect_to new_session_path

  end
end