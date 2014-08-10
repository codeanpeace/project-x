class SessionsController < ApplicationController

  skip_before_filter :require_login

  def new
    @user = User.new
    render :new
  end

  def create
    user = login(params[:username], params[:password], params[:remember_me])
    if user
      redirect_back_or_to root_url, :success => "You have successfully logged in."
      # :danger => "You have successfully logged in."
    else
      flash.now[:danger] = "Email or password was invalid"
      render :new
    end
  end

  def destroy
    logout
    redirect_back_or_to root_url, :success => "You have successfully logged out."
    # redirect_to root_url
    # flash.now[:success] = "You have successfully logged out."
  end
end