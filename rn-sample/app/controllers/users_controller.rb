class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    render :new unless @user.save
  end

  private

  # Strong Parametersはクッキーで設定している？
  def user_params
    params.require(:user).permit(:name, :account_id, :password, :password_confirmation)
  end
end
