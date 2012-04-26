require 'spec_helper'

describe Tip do
  describe 'Factory Girl' do
    it 'should user factory valid' do
      FactoryGirl.create(:tip).should be_valid
      FactoryGirl.build(:tip).should be_valid
    end
    it 'should multiple user factory valid' do
      FactoryGirl.create(:tip).should be_valid
      FactoryGirl.create(:tip).should be_valid
    end
  end

  describe 'With a tip' do
    
    describe 'we can update the title' do
      @tip1 = FactoryGirl.create(:tip, { :title => 'Unplug!', :content => 'Simply unplug items that you dont use very often.' })
      @tip1[:title] = 'hello'
      @tip1.save!
      @tip1.title.should == 'hello'
    end
    
    describe 'we can update the content' do
      @tip1 = FactoryGirl.create(:tip, { :title => 'Unplug!', :content => 'Simply unplug items that you dont use very often.' })
      @tip1[:content] = 'helloworld'
      @tip1.save!
      @tip1.content.should == 'helloworld'
    end
    
    describe 'tip by category is correct' do
      it 'should include correct tips' do
        @tip1 = FactoryGirl.create(:tip, { :title => 'Unplug!', :content => 'Simply unplug items that you dont use very often.' })
        @tip2 = FactoryGirl.create(:tip, { :title => 'Save Water!', :content => 'Show together' })
        @category1 = FactoryGirl.create(:category, { :name => "General" })
        @category2 = FactoryGirl.create(:category, { :name => "Office" })
        @category3 = FactoryGirl.create(:category, { :name => "Lab" })
        @tip_category1 = FactoryGirl.create(:category_tip, {:tip=>@tip1, :category=>@category1})
        @tip_category2 = FactoryGirl.create(:category_tip, {:tip=>@tip1, :category=>@category2})
        @tip_category2 = FactoryGirl.create(:category_tip, {:tip=>@tip2, :category=>@category2})

        @tips_by_category = Tip.tips_by_categories
        @tips_by_category[@category1.name].should include(@tip1)
        @tips_by_category[@category1.name].should_not include(@tip2)
        @tips_by_category[@category2.name].should include(@tip1)
        @tips_by_category[@category2.name].should include(@tip2)
        @tips_by_category[@category3.name].should == nil
      end
    end

#    describe 'we can update the category' do
#      @tip1 = FactoryGirl.create(:tip, { :title => 'Unplug!', :content => 'Simply unplug items that you dont use very often.' })
#      @category1 = Category.new(:name=>'Cat1')
#      @category2 = Category.new(:name=>'Cat2')
#      @tip_category = FactoryGirl.create(:category_tip, {:tip=>@tip1, :category=>@category1})
#      @tip_category[:category] = @category2
#      @tip1.save!
#      @tip1.category == @category2
#    end
    
  describe 'tips should have categories' do 
    it 'should retrieve the proper tips' do
      @category1 = Category.new(:name=>'Cat1')
      @category1.tips.should be_empty
      @tip1 = FactoryGirl.create(:tip, { :title => 'Unplug!', :content => 'Simply unplug items that you dont use very often.' })
      @tip_category = FactoryGirl.create(:category_tip, {:tip=>@tip1, :category=>@category1})
      @tip_category.tip.title.should == 'Unplug!'
      @tip1.should have(1).categories
    end
  end
  

    
  end
end


describe Tip do
  describe 'tip of the day is correct' do
    before :each do
      @general_category = FactoryGirl.create(:category, { :name => 'General' })
      @lab_category = FactoryGirl.create(:category, { :name => 'Lab' })
      @tip = FactoryGirl.create(:tip, { :title => 'This is a tip', :content => 'Turn off all the things!', :categories => [@general_category] })
      @other_tip = FactoryGirl.create(:tip, { :title => 'Problem solved!', :content => 'Drop an ice cube in the ocean every now and then', :categories => [@general_category] })
      @lab_tip = FactoryGirl.create(:tip, { :title => 'Boom!', :content => 'I know . . . we\'ll use science!', :categories => [@lab_category] })
      Tip.stub(:all).and_return([@tip, @other_tip, @lab_tip])
    end
    
    describe 'getting the tip for today' do
      it 'should get the correct tip for today' do
        index = Time.new.yday % 2
        Tip.should_receive(:all)
        Tip.tip_of_the_day.should == (index == 0 ? @tip : @other_tip)
      end
      
      it 'should ignore any tips not in the general category' do
        Tip.general_tips.length.should == 2
      end
      
      it 'should include tips which have more than one category' do
        @multi_tip = FactoryGirl.create(:tip, { :title => 'Protip', :content => 'Your argument is invalid.', :categories => [@general_category, @lab_category] })      
        Tip.stub(:all).and_return([@tip, @other_tip, @lab_tip, @multi_tip])
        tips = [@tip, @other_tip, @multi_tip]        
        index = Time.new.yday % 3
        Tip.tip_of_the_day.should == tips[index]
      end
    end
  end
end
