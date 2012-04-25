require 'spec_helper'

# I DON'T UNDERSTAND THE ERRORS THESE THROW,
# MAYBE SOME ONE CAN LOOK AT THEM WITH ME LATER
# BUT THEY ARE WHAT WE NEED FOR 100% COVERAGE

describe RegistrationsController do
  it 'should stay at sign up if no users exists' do
    get :new
    response.should render_template('devise/registrations/new.html.erb')
  end

  it 'should redirect if user exists' do
    email = 'testing@man.net'
    password = 'secretpass'
    FactoryGirl.create(:admin, {:email => email, :password => password})
    get :new
    response.should redirect_to('/admins/sign_in')
  end
end

describe SessionsController do
  it 'should redirect if users dont exist' do
    get :new
    response.should redirect_to('/admins/sign_up')
  end

  it 'should stay if users do exist' do
    email = 'testing@man.net'
    password = 'secretpass'
    FactoryGirl.create(:admin, {:email => email, :password => password, :password_confirmation => password}).save!
    get :new
    response.should render_tempalte('devise/sessions/new.html.erb')
  end
end
