class SessionsController < ApplicationController

  def new;end

  def create
    @user = User.find_by_credentials(params[:user])

    if @user
      sign_in!(@user)
    end

    redirect_back_or url_after_create
  end

  def destroy
    sign_out!
    redirect_back_or url_after_create
  end

  private

  def url_after_create
    '/'
  end

  def redirect_back_or(fallback)
    redirect_back(fallback_location: fallback)
  end
end
