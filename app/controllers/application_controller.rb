class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SessionsHelper

  private
  def require_logged_in_user
    unless logged_in?
      redirect_to root_path
    end
  end
end
