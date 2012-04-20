class RegistrationsController < Devise::RegistrationsController
  def new
    if Admin.find(:all).size == 0
      super
    else
      redirect_to '/admin'
    end
  end
end
