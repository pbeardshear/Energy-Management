require 'spec_helper'

describe Admin::TipsController do

  before :each do 
    @tip1 = FactoryGirl.create(:tip, { :title => 'Unplug!', :content => 'Simply unplug items that you don’t use very often.' })
    @tip2 = FactoryGirl.create(:tip, { :title => 'Turn Off BioSafety Cabinets', :content => 'Shut sashes and turn off blowers and lights at night.' })
    @category_general = FactoryGirl.create(:category, { :name => 'General' })
    @category_lab = FactoryGirl.create(:category, { :name => 'Lab' })
    @tip_category1 = FactoryGirl.create(:tip_category, {:tip => @tip1, :category => @category_general })
    @tip_category2 = FactoryGirl.create(:tip_category, {:tip => @tip2, :category => @category_lab })
  end



end
