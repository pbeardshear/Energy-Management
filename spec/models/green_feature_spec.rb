require 'spec_helper.rb'

describe GreenFeature do
  before do
    @feature = Factory(:green_feature, {:name => 'Flourescence', :content => 'This hall has flourescent light bulbs'})
  end

  describe "retrieving the halls which have a green feature" do
    it 'should retrieve the proper halls' do
      @feature.halls.should be_empty
      @hall = Factory(:hall, { :name => 'Test Hall' })
      @hall_feature = Factory(:hall_feature, { :hall => @hall, :green_feature_id => @feature })
      @feature.should have(1).halls(true)
      @feature.halls[0].name.should == 'Test Hall'
    end
  end

end
