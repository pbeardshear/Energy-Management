require 'spec_helper'

describe 'Category Spec' do
  describe 'Factory Girl' do
    it 'should user factory valid' do
      FactoryGirl.create(:category).should be_valid
      FactoryGirl.build(:category).should be_valid
    end
    it 'should multiple user factory valid' do
      FactoryGirl.create(:category).should be_valid
      FactoryGirl.create(:category).should be_valid
    end
  end
  
  describe 'With a tip' do
    
    describe 'we can update the title' do
      @category = FactoryGirl.create(:category, { :name => 'cate1'})
      @category[:name] = 'hello'
      @category.save!
      @category.name.should == 'hello'
    end
    
  describe 'categories should have tips' do 
    it 'should retrieve the proper tips' do
      @category = Category.new(:name=>'Cat1')
      @category.tips.should be_empty
      @tip = FactoryGirl.create(:tip, { :title => 'Unplug!', :content => 'Simply unplug items that you dont use very often.' })
      @tip_category = FactoryGirl.create(:category_tip, {:tip=>@tip, :category=>@category})
      @tip_category.tip.title.should == 'Unplug!'
      @tip.should have(1).categories
      @tip.categories[0].name.should == "Cat1"
    end
  end
  
end

end
