class ApplicationController < ActionController::Base
  include Authenticate::Controller

  protect_from_forgery with: :exception
end
