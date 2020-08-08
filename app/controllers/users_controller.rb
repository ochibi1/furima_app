class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:new, :logout]

  def new
  end

  def show 
    @user = User.find(params[:id])
  end

  def destroy
  end

  def logout
  end
end
