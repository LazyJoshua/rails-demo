class Admin::UsersController < ApplicationController

    layout 'admin'

    def index
        @users = User.page(params[:page] || 1).per_page(params[:per_page] || 5).order("id desc")
    end

    def search
        @users = User.page(params[:page] || 1).per_page(params[:per_page] || 5).order("id desc")
            .where(["username like ?", "%#{params[:username]}%"])
        render action: :index
    end
    
    
end
