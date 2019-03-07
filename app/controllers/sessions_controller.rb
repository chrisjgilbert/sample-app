class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      redirect_to user
    else
      flash[:danger] = 'Invalid email/password combintaion'
      render 'new'
    end
  end

  def destroy
  end
end
