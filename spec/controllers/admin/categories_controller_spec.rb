require 'spec_helper'

describe Admin::CategoriesController do
  before :each do
    @category = Category.new(:name=>'Cat1')
    @tip = FactoryGirl.create(:tip, { :title => 'Unplug!', :content => 'Simply unplug items that you dont use very often.' })
    @tip_shower = FactoryGirl.create(:tip, { :title => 'Save water!', :content => 'Shower with a friend!' })
    @tip_category = FactoryGirl.create(:category_tip, {:tip=>@tip, :category=>@category})
    Category.stub(:find_by_id).and_return(@category)
    CategoryTip.stub(:find_all_by_category_id).and_return([@tip])
    controller.stub!(:authenticate_admin!)
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
  
  describe 'new category creation page' do
    it 'should fetch all the categories' do
      Category.should_receive(:all)
      get :new
    end
  end

  describe 'create a category' do
	  it 'should create a new category entry' do
		  Category.should_receive(:create).and_return(@category)
		  post :create, :id => @category.id
		  response.should redirect_to(admin_categories_path)
	  end
    it 'should show an error message and redirect if category creation failed' do
      Category.stub(:create).and_return(nil)
      post :create, :id => @category.id
      flash[:error].should == 'Category creation failed.'
      response.should redirect_to(new_admin_category_path)
    end
  end
 
  describe 'edit a category' do
    it 'should fetch the correct Category to edit' do
      Category.should_receive(:find_by_id).with("#{@category.id}").and_return(@category)
      get :edit, :id => @category.id
      assigns(:category).should == @category
    end
    it 'should fetch all categories' do
      Category.should_receive(:all)
      get :edit, :id => @category.id
    end
  end

  describe 'update a category' do
    it 'should update the attributes of the selected category' do
      @category.should_receive(:update_attributes).and_return(true)
      post :update, {'id' =>  @category.id, 'name' => 'cool sauce'}
      response.should redirect_to(admin_categories_path)
    end
    it 'should show an error message and redirect if category creation failed' do
      @category.stub(:update_attributes).and_return(false)
      post :update, {'id' => @category.id, 'name' => 'hot sauce'}
      flash[:error].should == "Couldn't update #{@category.name}."
      response.should redirect_to(edit_admin_category_path)
    end
    it 'should show an error message and redirect if category not found' do
      Category.stub(:find_by_id).and_return(nil)
      post :update, {'id' => 666, 'name' => 'really hot sauce'}
      flash[:error].should == "That category does not exist."
      response.should redirect_to(admin_categories_path)
    end
  end
  
  
  describe 'destroy a category' do
   it 'should delete the appropriate category' do
      @category.should_receive(:destroy).and_return(true)
      post :destroy, :id => @category.id
      response.should redirect_to(:action => 'index')
   end
   it 'should show an error message and redirect if category not found' do
      Category.stub(:find_by_id).and_return(nil)
      post :destroy, :id => 666
      flash[:error].should == "That category does not exist."
      response.should redirect_to(admin_categories_path)
   end
   it 'should show an error message and redirect if destroy fails' do
      @category.stub(:destroy).and_return(false)
      post :destroy, :id => 1234
      flash[:error].should == "Sorry, you aren't strong enough to destroy this category."
      response.should redirect_to(edit_admin_category_path)
   end
  end 

  describe 'edit the tips belonging to a category' do
    it 'should find the correct category' do
      Category.should_receive(:find_by_id).with("#{@category.id}").and_return(@category)
      get :edit_tips, :id => @category.id
    end
    it 'should fetch all tips for display' do
      Tip.should_receive(:all)
      get :edit_tips, :id => @category.id
    end
    it 'should fetch the current tips under this category' do
      CategoryTip.should_receive(:find_all_by_category_id).with("#{@category.id}")
      get :edit_tips, :id => @category.id
    end
    it 'should show an error message and redirect if category not found' do
      Category.stub(:find_by_id).and_return(nil)
      get :edit_tips, :id => @category.id
      flash[:error].should == "That category does not exist."
      response.should redirect_to(admin_categories_path)
    end
  end

  describe 'update the tips belonging to a category' do
    it 'should find the correct category' do
      Category.should_receive(:find_by_id).with("#{@category.id}").and_return(@category)
      post :update_tips, :id => @category.id, :tips => [@tip_shower.id, @tip.id]
    end
    it 'should delete all the old tips with this category id and add tips selected by admin' do
      CategoryTip.should_receive(:destroy_all).with(:category_id=>@category.id)
      CategoryTip.should_receive(:create).with(:tip_id=>"#{@tip_shower.id}", :category_id=>@category.id)
      CategoryTip.should_receive(:create).with(:tip_id=>"#{@tip.id}", :category_id=>@category.id)
      post :update_tips, :id => @category.id, :tips => [@tip_shower.id, @tip.id]
    end
    it 'should set a notice message and redirect upon success' do
      post :update_tips, :id => @category.id, :tips => [@tip_shower.id, @tip.id]
      flash[:notice].should == "#{@category.name} tips successfully updated."
      response.should redirect_to(admin_category_path)
    end
    it 'should show an error message and redirect if category not found' do
      Category.stub(:find_by_id).and_return(nil)
      post :update_tips, :id => 345, :tips => [@tip_shower.id, @tip.id]
      flash[:error].should == "That category does not exist."
      response.should redirect_to(admin_categories_path)
    end
  end

end
