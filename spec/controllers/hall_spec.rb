require 'spec_helper'

describe HallController do
    before :each do
		@hall = Factory(:hall, { :name => 'Test Hall', :key => '12345678' })
		@feature = Factory(:greenfeature, { :name => 'Flourscence', :content => 'This hall has flourscent light bulbs' })
        @hall_feature = Factory(:hallfeature, { :hall_id => @hall.id, :green_feature_id => @feature.id })
	end
	
	describe 'access the graph data for the hall' do
	  it 'should retrieve the graph from the hall' do
	    @hall.stub(:get_graph)
	    @hall.should_receive(:get_graph)
	    get :details, :id => @hall.id
	  end
	  
	  it 'should see the correct graph in the response' do
	    get :details, :id=> @hall.id
	    response.should contain("?key=12345678")
	  end
	end
	
	describe 'it should see the green features for the specified hall'
		get :details, id=> @hall.id
		response.should contain("This hall has flourscent light bulbs")
	end
    end
end
