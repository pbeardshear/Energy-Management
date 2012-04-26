class RegistrationsController < ::Devise::RegistrationsController
  layout 'admin'

  def new
    if Admin.find(:all).size == 0
      super
    else
      # If I want to register, but an admin already exists go to sign in
      redirect_to '/admins/sign_in'
    end
  end
end
