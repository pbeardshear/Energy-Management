require 'spec_helper'

describe TipsController do

  before :each do 
    @tip1 = FactoryGirl.create(:tip, { :title => 'Unplug!', :content => "Simply unplug items that you don't use very often." })
    @tip2 = FactoryGirl.create(:tip, { :title => 'Turn Off BioSafety Cabinets', :content => 'Shut sashes and turn off blowers and lights at night.' })
    @category_general = FactoryGirl.create(:category, { :name => 'General' })
    @category_lab = FactoryGirl.create(:category, { :name => 'Lab' })
    @category_tip1 = FactoryGirl.create(:category_tip, {:tip => @tip1, :category => @category_general })
    @category_tip2 = FactoryGirl.create(:category_tip, {:tip => @tip2, :category => @category_lab })
    Tip.stub(:find_by_id).with(@tip1.id).and_return(@tip1)
    Tip.stub(:find_by_id).with(@tip2.id).and_return(@tip2)
    Category.stub(:find_by_name).with("General").and_return(@category_general)
    Category.stub(:find_by_name).with("Lab").and_return(@category_lab)
  end

  describe 'access the tip index' do
    it 'should retrieve the list of all tips' do
      Tip.should_receive(:all)
      get :index
    end
  end
end
