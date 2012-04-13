class SessionsController < ApplicationController

  def new
  end

  def create
    if login(params[:username], params[:password])
      redirect_to(root_path, notice: "You have successfully logged in.")
    else
      flash.now[:alert] = "Authentication has failed!"
      render :new
    end
  end

  def destroy
    logout
    redirect_to(root_path, notice: "You have successfully logged out.")
  end
end
