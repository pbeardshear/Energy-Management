require 'spec_helper'

describe Admin::TipsController do

  before :each do 
    @tip1 = FactoryGirl.create(:tip, { :title => 'Unplug!', :content => "Simply unplug items that you don't use very often." })
    @tip2 = FactoryGirl.create(:tip, { :title => 'Turn Off BioSafety Cabinets', :content => 'Shut sashes and turn off blowers and lights at night.' })
    @category_general = FactoryGirl.create(:category, { :name => 'General' })
    @category_lab = FactoryGirl.create(:category, { :name => 'Lab' })
#@category_tip1 = FactoryGirl.create(:category_tip, {:tip => @tip1, :category => @category_general })
#   @category_tip2 = FactoryGirl.create(:category_tip, {:tip => @tip2, :category => @category_lab })
    Tip.stub(:find_by_id).with(@tip1.id).and_return(@tip1)
    Tip.stub(:find_by_id).with(@tip2.id).and_return(@tip2)
  end

  describe 'access the tip index' do
    it 'should retrieve the list of all tips' do
      Tip.should_receive(:all)
      get :index
    end
  end

  describe 'show a tip' do
    it 'should find the correct tip by id' do
      Tip.should_receive(:find_by_id).with(@tip2.id.to_s).and_return(@tip2)
      get :show, :id => @tip2.id
    end
  end

  describe 'visiting the edit page for a tip' do
    it 'should find the correct tip by id' do
      Tip.should_receive(:find_by_id).with(@tip2.id.to_s).and_return(@tip2)
      get :edit, :id => @tip2.id
    end
  end

  describe 'create a new tip' do
    it 'should try to create a new tip object with the given params' do
      Tip.should_receive(:create).with(
          { "title" => 'Unplug', "content" => "Simply unplug items that you don't use very often." }).and_return(@tip1)
      post :create, :tip => { :title => 'Unplug', :content => "Simply unplug items that you don't use very often." }, :categories => ["General"]
    end
    context 'tip successfully created' do
      before :each do
        Tip.stub(:create).and_return(@tip1)
        post :create, :tip => { :title => 'Unplug', :content => "Simply unplug items that you don't use very often." }, :categories => ["General"]
      end
      it 'should create category tip entries for the new tip'
      it 'should set a notice message notifying admin of success'
      it 'should redirect to the tips index for admins'
    end
    context 'tip not successfully created' do
      before :each do
        Tip.stub(:create).and_return(nil)
        post :create, :tip => { :title => 'Unplug', :content => "Simply unplug items that you don't use very often." }, :categories => ["General"]
      end
      it 'should set a notice message notifying admin of failure'
      it 'should redirect to the tip creation page'
    end
  end

  describe 'update an existing tip' do
    it 'should find the correct tip to update'
    it 'should try to update the tip attributes with the given params'
    context 'tip successfully updated' do
      it 'should set a notice message notifying admin of success'
    end
    context 'tip not successfully updated' do
      it 'should set a notice message notifying admin of failure'
    end
    it 'should redirect to the tip page'
  end

  describe 'delete a tip' do
    it 'should find the correct tip to delete'
    it 'should try to destroy the tip'
    context 'tip successfully destroyed' do
      it 'should set a notice message notifying admin of success'
    end
    context 'tip not successfully destroyed' do
      it 'should set a notice message notifying admin of failure'
    end
    it 'should redirect to the tip index page for admins'
  end

end
