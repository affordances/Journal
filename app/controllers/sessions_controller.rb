class SessionsController < ApplicationController

  def new
    @user = User.new_guest
    sign_in!(@user)
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
