require 'spec_helper'

describe HomeController do
  before :each do
    general_category = FactoryGirl.create(:category, { :name => 'General' })
    @tip = FactoryGirl.create(:tip, { :title => 'This is a tip', :content => 'Turn off all the things!', :categories => [general_category] })
    @other_tip = FactoryGirl.create(:tip, { :title => 'Problem solved!', :content => 'Drop an ice cube in the ocean every now and then', :categories => [general_category] })
    Tip.stub(:all).and_return([@tip, @other_tip])
  end
  describe 'displaying the tip for today' do
    it 'should display the correct tip for today' do
      time = Time.new
      index = (time.month + time.day) % 2;
      Tip.should_receive(:all)
      get :index
      assigns(:tip_of_the_day).should == (index == 0 ? @tip : @other_tip)
    end
  end
end
