class UsersController < ApplicationController

  skip_before_filter :require_login, :only => [:index, :new, :create, :activate]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_url, flash[:notice] => "You have successfully signed up!"
    else
      render :new
    end
  end

  def activate
    if (@user = User.load_from_activation_token(params[:id]))
      @user.activate!
      redirect_to(login_path, :notice => 'User was successfully activated.')
    else
      not_authenticated
    end
  end

  def show
  end
end
