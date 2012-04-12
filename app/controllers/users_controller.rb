class UsersController < ApplicationController
  expose(:user)

  def create
    if user.save
      session[:user_id] = user.id
      redirect_to(root_path, notice: "You have successfully registered.")
    else
      render :new
    end
  end
end
