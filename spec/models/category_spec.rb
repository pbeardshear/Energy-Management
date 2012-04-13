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
      @category.should have(1).tips(true)
      @tip.categories[0].name.should == "Cat1"
    end
    
    it 'can have more than 1 tip' do
      @category = Category.new(:name=>'Cat1')
      @category.tips.should be_empty
      @tip1 = FactoryGirl.create(:tip, { :title => 'tip1', :content => 'Simply unplug items that you dont use very often.' })
      @tip2 = FactoryGirl.create(:tip, { :title => 'tip2', :content => 'Simply unplug items that you dont use very often.' })
      @tip_category1 = FactoryGirl.create(:category_tip, {:tip=>@tip1, :category=>@category})
      @tip_category1.tip.title.should == 'tip1'
      @tip_category2 = FactoryGirl.create(:category_tip, {:tip=>@tip2, :category=>@category})
      @tip_category2.tip.title.should == 'tip2'
      @tip1.should have(1).categories
      @tip2.should have(1).categories
      
      @category.should have(2).tips(true)
      @tip1.categories[0].name.should == "Cat1"
      @tip2.categories[0].name.should == "Cat1"
      
      @category.tips[0].title.should == 'tip1'
      @category.tips[1].title.should == 'tip2'
    
      
    end
    
  end
  
end

end
