require 'spec_helper.rb'

describe Hall do
  before do
    @hall = Factory(:hall, { :name => 'Test Hall', :key => 12345678 })
  end

  describe "retrieving the hall's energy data" do
    it 'should retrieve the properly formed embedded script' do
      @hall.get_graph.should match(/^<script src='http:\/\/my.pulseenergy.com\/embed\/.*<\/script>$/)
    end

    it 'should return the proper key for this hall' do
      @hall.get_graph.should match(/\?key=12345678/)
    end
  end
  
  describe "retrieving the hall's energy green features" do
    before do
      @hall = Factory(:hall, { :name => 'Test Hall', :key => 1 })
    end
    
    it 'should retrieve the proper green features' do
      @hall.green_features.should be_empty
      @feature = Factory(:green_feature, { :name => 'Fluorescence', :content => 'This hall has fluorescent light bulbs' })
      @hall_feature = Factory(:hall_feature, { :hall => @hall, :green_feature => @feature })
      @hall.should have(1).green_features(true)
      @hall.green_features[0].content.should == 'This hall has fluorescent light bulbs'
    end
  end

end
