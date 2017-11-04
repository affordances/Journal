class SessionsController < ApplicationController
  before_action :redirect_signed_in_users, only: [:new]

  def new;end

  def create
    @user = User.find_by_credentials(params[:user])

    if @user
      sign_in!(@user)
      redirect_back_or url_after_create
    else
      flash.now[:errors] = ["Invalid email and/or password"]
      render :new
    end
  end

  def destroy
    sign_out!
    redirect_back_or url_after_create
  end

  private

  def redirect_signed_in_users
    redirect_to url_for_signed_in_users if signed_in?
  end

  def url_after_create
    '/'
  end

  def url_for_signed_in_users
    url_after_create
  end

  def redirect_back_or(fallback)
    redirect_back(fallback_location: fallback)
  end
end
