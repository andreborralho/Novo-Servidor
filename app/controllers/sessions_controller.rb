class SessionsController < ApplicationController
  def new
    @title = 'Sign In'
  end

  def create
    user = User.authenticate(params[:name], params[:password])

    if user
      session[:user_id] = user.id
      redirect_to countries_path
    else
      redirect_to login_url, :alert => "Invalid user/password combination"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_url
  end
end