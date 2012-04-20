class SessionsController < Devise::SessionsController
  def new
    if Admin.find(:all).size == 0
      redirect_to '/admins/sign_up'
    else
      super
    end
  end
end
