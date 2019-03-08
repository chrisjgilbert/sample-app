class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to user
    else
      flash[:danger] = "Invalid email/password combination"
      render 'new'
    end
  end

  def destroy
  end
end
