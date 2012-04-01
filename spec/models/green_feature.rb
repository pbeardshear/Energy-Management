require 'spec_helper.rb'

describe GreenFeature do
  before do
    @feature = Factory(:greenfeature, {:name => 'Flourescence', :content => 'This hall has flourescent light bulbs'})
  end

  describe "retrieving the halls which have a green feature" do
    it 'should retrieve the proper halls' do
      @feature.halls.should be_empty
      @hall = Factory(:greenfeature, { :name => 'Test Hall' })
      @hall_feature = Factory(:hallfeature, { :hall_id => @hall.id, :green_feature_id => @feature.id })
      @feature.should have(1).hall
      @feature.halls[0].name.should == 'Test Hall'
    end
  end

end
