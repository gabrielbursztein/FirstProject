# Aplication Controller
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def after_sign_out_path_for(_)
    new_user_session_path
  end
end
