class SessionsController < ApplicationController
# handle login page render
  def new
  end

  # handle login post
  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to '/'
    else
      render 'new'
    end
  end

  # handle logout
  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end

end
