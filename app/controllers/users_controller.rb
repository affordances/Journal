class UsersController < ApplicationController

  def new; end

  def create
    @user = params[:user] ? User.new(user_params) : User.new_guest

    if @user.save
      current_user.move_to(@user) if current_user && current_user.guest?
      sign_in!(@user)
      redirect_back_or url_after_create
    end

    redirect_back_or url_after_create
  end

  private

  def url_after_create
    '/'
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def redirect_back_or(fallback)
    redirect_back(fallback_location: fallback)
  end
end
