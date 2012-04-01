require 'spec_helper.rb'

describe Hall do
  before do
    @hall = Factory(:hall, { :name => 'Test Hall', :key => '12345678' })
  end

  describe "retrieving the hall's energy data" do
    it 'should retrieve the properly formed embedded script' do
      @hall.get_graph.should  match(/^<script src="http:\/\/my.pulseenergy.com\/embed\/.*<\/script>$/)
    end
    it 'should return the proper key for this hall' do
      @hall.get_graph.should match(/\?key=12345678/)
    end
  end

  describe "retrieving the hall's energy green features" do
    before do
      @hall = Factory(:hall, { :name => 'Test Hall' })
    end

    it 'should retrieve the proper green features' do
      @hall.features.should be_empty
      @feature = Factory(:greenfeature, { :name => 'Flourscence', :content => 'This hall has flourscent light bulbs' })
      @hall_feature = Factory(:hallfeature, { :hall_id => @hall.id, :green_feature_id => @feature.id })
      @hall.should have(1).features
      @hall.get_features[0].content.should == 'This hall has flourscent light bulbs'
    end
  end

end
