require 'spec_helper'

describe Admin::CategoriesController do
  before :each do
    @category = Category.new(:name=>'Cat1')
    @tip = FactoryGirl.create(:tip, { :title => 'Unplug!', :content => 'Simply unplug items that you dont use very often.' })
    @tip_category = FactoryGirl.create(:category_tip, {:tip=>@tip, :category=>@category})
    Category.stub(:find_by_id).and_return(@category)
  end
  
  describe 'access the categories index' do
    it 'should retrieve the list of all categories' do
      Category.should_receive(:all)
      get :index
    end
   end

   describe 'show a category' do
    it 'should show an error message and redirect if category not found' do
      Category.should_receive(:find_by_id).and_return(nil)
      get :show, :id => 999
      flash[:error].should == 'That category does not exist.'
      response.should redirect_to(admin_categories_path)
    end
    it 'should retrieve the tips from the category' do
      @category.should_receive(:tips)
      get :show, :id => @category.id
    end
  end
  
  describe 'create a category' do
#it 'should create a new category entry' do
#     Category.should_receive(:create)
#     post 'create', {:name => 'Cat2'}
#     response.should redirect_to(:action => 'show')
#   end
  end
 
  describe 'update a category' do
#   it 'should update the attributes of the selected category' do
#     @category.should_receive(:update_attributes)
#     post 'update', {'category_id' =>  @category.id, 'name' => 'cool sauce'}
#     response.should redirect_to(:action => 'show')
#   end
  end
  
  
  describe 'destroy a category' do
#   it 'should delete the appropriate category' do
#     @category.should_receive(:destroy)
#     post 'delete', {'category_id' =>  @category.id}
#     response.should redirect_to(:action => 'show')
#   end
  end
  
end
