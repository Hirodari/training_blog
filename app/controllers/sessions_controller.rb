class SessionsController < ApplicationController

  def new
  end

  def create
    #byebug
    usr = User.find_by(email: params[:session][:email].downcase)
    if usr && usr.authenticate(params[:session][:password])
      session[:user_id] = usr.id
      flash[:success] = "#{usr.username} successfully logged in"
      redirect_to user_path(usr)
    else
      flash.now[:danger] = "wrong credentials!"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:info] = "Log out successfully!"
    redirect_to root_path
  end

end
