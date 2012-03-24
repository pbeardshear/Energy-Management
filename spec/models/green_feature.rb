require 'spec_helper.rb'

describe GreenFeature do
  before do
    @hall = Factory(:hall, { :name => 'Test Hall' })
  end

  describe "retrieving the hall's energy green features" do
    it 'should retrieve the proper green features' do
      @hall.features.should be_empty
      @feature = Factory(:greenfeature, { :name => 'Flourscence', :content => 'This hall has flourscent light bulbs' })
      @hall_feature = Factory(:hallfeature, { :hall_id => @hall.id, :green_feature_id => @feature.id })
      @hall.should have(1).features
      @hall.features[0].content.should == 'This hall has flourscent light bulbs'
    end
  end
end
