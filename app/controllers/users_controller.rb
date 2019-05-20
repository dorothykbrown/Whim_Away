class UsersController < ApplicationController
  before_action :set_user, only: %i[edit update destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to properties_index_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to properties_index_path
  end

  def destroy
    @user.destroy
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :photo, :user_type, :email, :encrypted_password)
  end
end
