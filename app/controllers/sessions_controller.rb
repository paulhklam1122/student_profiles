class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email params[:email]
    if user && user.authenticate(params[:password])
      sign_in(user)
      redirect_to root_path, notice: "Signed in!"
    else
      flash[:alert] = "Unable to sign in!"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Signed out."
  end
end
