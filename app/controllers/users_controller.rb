class UsersController < ApplicationController
  before_action :redirect_signed_in_users, only: [:create, :new]
  
  def new; end

  def create
    @user = User.new(user_params)

    if @user.save
      sign_in!(@user)
      redirect_back_or url_after_create
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  private

  def redirect_signed_in_users
    redirect_to url_for_signed_in_users if signed_in?
  end

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
