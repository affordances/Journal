class UsersController < ApplicationController

  def new; end

  def create
    @user = User.new(user_params)

    if @user.save
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
