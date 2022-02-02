class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def create
    @user = User.new(permit_user_params)
    if @user && @user.authenticate(params[:password])
      @user.save!
      render json: @user
    else
      render json: @user.errors
    end
  end

  def update
    @updateUser = User.find(params[:id])
    @updateUser.update(permit_user_params)
    render json: @updateUser
  end

  def destroy
    @deleteUser = User.find(params[:id])
    @deleteUser.destroy
    render json: @deleteUsers
  end

  def permit_user_params
    params.permit(:first_name, :last_name, :email, :password)
  end
end
