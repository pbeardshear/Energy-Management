require 'spec_helper'

describe HomeController do
  before :each do
    @general_category = FactoryGirl.create(:category, { :name => 'General' })
    @lab_category = FactoryGirl.create(:category, { :name => 'Lab' })
    @tip = FactoryGirl.create(:tip, { :title => 'This is a tip', :content => 'Turn off all the things!', :categories => [@general_category] })
    @other_tip = FactoryGirl.create(:tip, { :title => 'Problem solved!', :content => 'Drop an ice cube in the ocean every now and then', :categories => [@general_category] })
    @lab_tip = FactoryGirl.create(:tip, { :title => 'Boom!', :content => 'I know . . . we\'ll use science!', :categories => [@lab_category] })
    Tip.stub(:all).and_return([@tip, @other_tip, @lab_tip])
  end
  describe 'displaying the tip for today' do
    it 'should display the correct tip for today' do
      time = Time.new
      index = (time.month + time.day) % 2;
      Tip.should_receive(:all)
      get :index
      assigns(:tip_of_the_day).should == (index == 0 ? @tip : @other_tip)
    end
    
    it 'should ignore any tips not in the general category' do
      get :index
      assigns(:general_tips).length.should == 2
    end
    
    it 'should include tips which have more than one category' do
      @multi_tip = FactoryGirl.create(:tip, { :title => 'Protip', :content => 'Your argument is invalid.', :categories => [@general_category, @lab_category] })      
      Tip.stub(:all).and_return([@tip, @other_tip, @lab_tip, @multi_tip])
      time = Time.new
      index = (time.month + time.day) % 3;
      get :index
      assigns(:general_tips).length.should == 3
      tips = [@tip, @other_tip, @multi_tip]
      assigns(:tip_of_the_day).should == tips[index]
    end
  end
end
