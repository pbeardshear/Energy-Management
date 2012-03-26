require 'spec_helper'

describe HallController do
    before :each do
		@hall = Factory(:hall, { :name => 'Test Hall', :key => '12345678' })
		@feature = Factory(:greenfeature, { :name => 'Flourscence', :content => 'This hall has flourscent light bulbs' })
        @hall_feature = Factory(:hallfeature, { :hall_id => @hall.id, :green_feature_id => @feature.id })
	end
	
	describe 'it should see the graph for the specified hall'
		get :details, :id=> @hall.id
		response.should contain("?key=12345678")
	end
	
	describe 'it should see the green features for the specified hall'
		get :details, id=> @hall.id
		response.should contain("This hall has flourscent light bulbs")
	end
	
	describe 'it should call the model method of the specified hall'
		get :details, id=> @hall.id
		@hall.should_recieve(:get_graph).and_return("http://my.pulseenergy.com/embed/?key=12345678")
	end
		
	
end
