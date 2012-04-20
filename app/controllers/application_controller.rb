class ApplicationController < ActionController::Base
  protect_from_forgery
  layout :layout_by_resource

  helper ApplicationHelper

  def after_sign_in_path_for(resource)
    "/admin/"
  end

  def after_sign_out_path_for(resource)
    "/"
  end

  protected

  def layout_by_resource
    if devise_controller?
      "admin"
    else
      "application"
    end
  end
end
