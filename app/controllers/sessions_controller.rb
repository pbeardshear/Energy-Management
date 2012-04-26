class SessionsController < ::Devise::SessionsController
  layout 'admin'

  def new
    if Admin.find(:all).size == 0
      # If I want to sign in, but no users have exist, go to sign up page
      redirect_to '/admins/sign_up'
    else
      super
    end
  end
end
