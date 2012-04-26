class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for(resource)
    "/admin/"
  end

  def after_sign_out_path_for(resource)
    "/admins/sign_in"
  end

end
