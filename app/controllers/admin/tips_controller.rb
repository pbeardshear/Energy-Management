class Admin::TipsController < ApplicationController
  before_filter :authenticate_admin!
  layout 'admin'

  def index
    @tips = Tip.all
  end

  def show
    @tip = Tip.find_by_id params[:id]
    if !@tip
      # redirect to the index page
      flash[:error] = "That tip does not exist."
      redirect_to admin_tips_path
    end
  end

  def new
    @categories = Category.all
  end

  def create
    @tip = Tip.create params[:tip]
    if @tip and @tip.id
      if params[:categories]
        params[:categories].each do |name|
          # checked is always "1" in here, i.e. only checked categories are passed
          CategoryTip.create :tip_id => @tip.id, :category_id => Category.find_by_name(name).id
        end
      end
      flash[:notice] = "#{@tip.title} was successfully created."
      redirect_to admin_tips_path
    else
      # tip create failed, redirect back to "new" view
      flash[:error] = "Tip creation failed."
      redirect_to new_admin_tip_path
    end
  end

  def edit
    @tip = Tip.find_by_id params[:id]
    @categories = Category.all
  end

  def update
    @tip = Tip.find_by_id params[:id]
    if @tip
      valid_update = @tip.update_attributes params[:tip]
      if !valid_update
        flash[:error] = "Couldn't update #{@tip.title}."
        redirect_to edit_admin_tip_path
      
      else
        # remove all categories with this tip's id, in lieu of adding the selected ones
        CategoryTip.destroy_all :tip_id => params[:id]
        if params[:categories]
          params[:categories].each do |name|
            # checked is always "1" in here, i.e. only checked categories are passed
            CategoryTip.create :tip_id => params[:id], :category_id => Category.find_by_name(name).id
          end
        end
        flash[:notice] = "#{@tip.title} was successfully updated."
        redirect_to admin_tip_path @tip
      end
    else
      # Couldn't find the tip, redirect to the index page with an error
      flash[:error] = "That tip does not exist."
      redirect_to admin_tips_path
    end
  end

  def destroy
    @tip = Tip.find_by_id params[:id]
    if @tip
      if @tip.destroy
        flash[:notice] = "Tip '#{@tip.title}' deleted."
        redirect_to admin_tips_path
      else
        flash[:error] = "Sorry, you aren't strong enough to destroy this tip."
        redirect_to edit_admin_tip_path
      end
    else
      # tip was not found
      flash[:error] = "That tip does not exist."
      redirect_to admin_tips_path
    end
  end

end
