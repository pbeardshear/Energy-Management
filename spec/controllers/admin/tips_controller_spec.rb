require 'spec_helper'

describe Admin::TipsController do

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

  describe 'show a tip' do
    it 'should find the correct tip by id' do
      Tip.should_receive(:find_by_id).with(@tip2.id.to_s).and_return(@tip2)
      get :show, :id => @tip2.id
    end
    context 'id not found' do
      before :each do
        Tip.stub(:find_by_id).and_return(nil)
        get :show, :id => 3
      end
      it 'should set an error message notifying admin of failure' do
        flash[:error].should == "That tip does not exist."
      end
      it 'should redirect to the tip index page for admins' do
        response.should redirect_to(admin_tips_path)
      end
    end
  end

  describe 'visiting the edit page for a tip' do
    it 'should find the correct tip by id' do
      Tip.should_receive(:find_by_id).with(@tip2.id.to_s).and_return(@tip2)
      get :edit, :id => @tip2.id
    end
  end

  describe 'create a new tip' do
    before :each do
      @tip_params = { :title => 'Unplug!', :content => "Simply unplug items that you don't use very often." }
      @tip_params_string = { "title" => 'Unplug!', "content" => "Simply unplug items that you don't use very often." }
    end
    it 'should try to create a new tip object with the given params' do
      Tip.should_receive(:create).with(@tip_params_string).and_return(@tip1)
      post :create, :tip => @tip_params, :categories => ["General"]
    end
    context 'tip successfully created' do
      before :each do
        Tip.stub(:create).and_return(@tip1)
      end
      it 'should create category tip entries for the new tip' do
        CategoryTip.should_receive(:create).with(:tip_id => @tip1.id, :category_id => @category_general.id) 
        post :create, :tip => @tip_params, :categories => ["General"]
      end
      it 'should set a notice message notifying admin of success' do
        post :create, :tip => @tip_params, :categories => ["General"]
        flash[:notice].should == 'Unplug! was successfully created.'
      end
      it 'should redirect to the tips index for admins' do
        post :create, :tip => @tip_params, :categories => ["General"]
        response.should redirect_to(admin_tips_path)
      end
    end
    context 'tip not successfully created' do
      before :each do
        Tip.stub(:create).and_return(nil)
        post :create, :tip => @tip_params, :categories => ["General"]
      end
      it 'should set an error message notifying admin of failure' do
        flash[:error].should == "Tip creation failed."
      end
      it 'should redirect to the tip creation page' do
        response.should redirect_to(new_admin_tip_path)
      end
    end
  end

  describe 'update an existing tip' do
    before :each do
      @tip_params = { :title => 'Unplug!', :content => "Do it." }
      @tip_params_string = { "title" => 'Unplug!', "content" => "Do it."}
    end
    it 'should find the correct tip to update' do
      Tip.should_receive(:find_by_id).with(@tip1.id.to_s).and_return(@tip1)
      post :update, :id => @tip1.id, :tip => @tip_params, :categories => ["Lab"]
    end
    context 'tip not found' do
      before :each do
        Tip.stub(:find_by_id).and_return(nil)
        post :update, :id => 3, :tip => @tip_params, :categories => ["Lab"]
      end
      it 'should set an error message notifying admin of failure' do
        flash[:error].should == "That tip does not exist."
      end
      it 'should redirect to the tip page for admins' do
        response.should redirect_to(admin_tips_path)
      end
    end
    context 'tip found' do
      before :each do
        Tip.stub(:find_by_id).and_return(@tip1)
      end
      it 'should try to update the tip attributes with the given params' do
        @tip1.should_receive(:update_attributes).with(@tip_params_string)
        post :update, :id => @tip1.id, :tip => @tip_params, :categories => ["Lab"]
      end
      context 'tip successfully updated' do
        before :each do
          @tip2.stub(:update_attributes).with(@tip1)
        end 
        it 'should update the categories associated with the tip' do
          CategoryTip.should_receive(:destroy_all).with(:tip_id => @tip1.id.to_s)
          CategoryTip.should_receive(:create).with(:tip_id => @tip1.id.to_s, :category_id => @category_lab.id)
          post :update, :id => @tip1.id, :tip => @tip_params, :categories => ["Lab"]
        end
        it 'should set a notice message notifying admin of success' do
          post :update, :id => @tip1.id, :tip => @tip_params, :categories => ["Lab"]
          flash[:notice].should == "#{@tip1.title} was successfully updated."
        end
        it 'should redirect to the tip page' do 
          post :update, :id => @tip1.id, :tip => @tip_params, :categories => ["Lab"]
          response.should redirect_to(admin_tip_path)
        end
      end
      context 'tip not successfully updated' do
        before :each do
          @tip1.stub(:update_attributes).and_return(false)
          post :update, :id => @tip1.id, :tip => @tip_params, :categories => ["Lab"]
        end
        it 'should set an error message notifying admin of failure' do
          flash[:error].should == "Couldn't update #{@tip1.title}."
        end
        it 'should redirect to the edit page for the tip' do
          response.should redirect_to(edit_admin_tip_path)
        end
      end
    end
  end

  describe 'delete a tip' do
    it 'should find the correct tip to delete' do
      Tip.should_receive(:find_by_id).with(@tip2.id.to_s).and_return(@tip2)
      post :destroy, :id => @tip2.id
    end
    context 'tip not found' do
      before :each do
        Tip.stub(:find_by_id).and_return(nil)
        post :destroy, :id => 999
      end
      it 'should set an error message notifying admin of failure' do
        flash[:error].should == "That tip does not exist."
      end
      it 'should redirect to the tip page for admins' do
        response.should redirect_to(admin_tips_path)
      end
    end
    context 'tip found' do
      before :each do
        Tip.stub(:find_by_id).and_return(@tip2)
      end
      it 'should try to destroy the tip' do
        @tip2.should_receive(:destroy)
        post :destroy, :id => @tip2.id
      end
      context 'tip successfully destroyed' do
        before :each do
          @tip2.stub(:destroy).and_return(@tip2)
          post :destroy, :id => @tip2.id
        end
        it 'should set a notice message notifying admin of success' do
          flash[:notice].should == "Tip '#{@tip2.title}' deleted."
        end
      end
      context 'tip not successfully destroyed' do
        before :each do
          @tip2.stub(:destroy).and_return(false)
          post :destroy, :id => @tip2.id
        end
        it 'should set a notice message notifying admin of failure' do
          flash[:error].should == "Sorry, you aren't strong enough to destroy this tip."
        end
      end
      it 'should redirect to the tip index page for admins' do
        post :destroy, :id => @tip2.id
        response.should redirect_to(admin_tips_path)
      end
    end
  end

end
