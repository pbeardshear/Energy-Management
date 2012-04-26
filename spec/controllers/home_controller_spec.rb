require 'spec_helper'

describe HomeController do
  describe 'getting the tip of the day' do
    it 'should call the model method tip of the day' do
      Tip.should_receive(:tip_of_the_day)
      get :index
    end
  end
end
