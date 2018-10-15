class SessionsController < ApplicationController
# handle login page render
  def new
  end

  # handle login post
  def create
    if @user = User.authenticate_with_credentials(params[:email], params[:password])
      session[:user_id] = @user.id
      redirect_to '/'
    else
      render 'new'
    end
  end

  # handle logout
  def destroy
    session[:user_id] = nil
    cookies[:cart] = nil
    redirect_to login_path
  end

end
