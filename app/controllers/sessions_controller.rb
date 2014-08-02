class SessionsController < ApplicationController

  skip_before_filter :require_login

  def new
    @user = User.new
    render :new
  end

  def create
    user = login(params[:username], params[:password], params[:remember_me])
    if user
      redirect_back_or_to root_url, :notice => "You have successfully logged in."
    else
      flash.now.alert = "Email or password was invalid"
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_url, :notice => "You have successfully logged out."
  end
end