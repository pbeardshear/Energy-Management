require 'spec_helper.rb'

describe Hall do
  before do
    @hall = Factory(:hall, { :name => 'Test Hall', :key => '12345678' })
  end
  describe 'retrieving the hall's energy data' do
    it 'should retrieve the properly formed embedded script' do
      @hall.get_graph.should  match(/^<script src="http:\/\/my.pulseenergy.com\/embed\/.*<\/script>$/)
    end
    it 'should return the proper key for this hall' do
      @hall.get_graph.should match(/?key=12345678/)
    end
  end
end

