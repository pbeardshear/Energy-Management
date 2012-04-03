require 'spec_helper'

describe 'halls/show.html.erb' do

  before :each do
    @hall = FactoryGirl.create(:hall, { :name => 'Test Hall', :key => 12345678 })
    @feature1 = FactoryGirl.create(:green_feature, { :name => 'Fluorescence', :content => 'This hall has fluorescent light bulbs' })
    @feature2 = FactoryGirl.create(:green_feature, { :name => 'Low-flow toilets', :content => 'This hall has low-flow toilets' })
    assign(:path, @hall.get_graph)
    assign(:hall, @hall)
    assign(:green_features, [])
  end

  it "should have a tab for its graph" do
    render
    rendered.should have_selector("a", :content => "Graph")
  end

  it "should have a tab for its green features" do
    render
    rendered.should have_selector("a", :content => "Green Features")
  end

  it 'should see the correct graph' do
    render
    rendered.should include("?key=12345678")
  end

  context "given the hall has green features" do
    before :each do
      @hall_feature = FactoryGirl.create(:hall_feature, { :hall => @hall, :green_feature => @feature1 })
      assign(:green_features, @hall.green_features(true))
      render
    end

    it "should display the green features specific to this hall" do
      rendered.should include("This hall has fluorescent light bulbs")
    end

    it "should not display green features not in this hall" do
      rendered.should_not include("This hall has low-flow toilets")
    end
  end

  context "given the hall has no green features" do
    before :each do
      render
    end
      it "should not display any green features" do
        rendered.should_not include("This hall has fluorescent light bulbs")
        rendered.should_not include("This hall has low-flow toilets")
      end
  end
end
