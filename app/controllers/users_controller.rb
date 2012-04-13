class UsersController < ApplicationController
  expose(:user)

  def create
    if user.save
      auto_login(user)
      redirect_to(root_path, notice: "You have successfully registered.")
    else
      render :new
    end
  end
end
