class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:new, :logout]

  def new
  end

  def show 
  end

  def destroy
  end

  def logout
  end
end
