class Admin::CategoriesController < ApplicationController
  before_filter :authenticate_admin!
  layout 'admin'

  def index
    @categories = Category.all
    @tips_by_categories = Tip.tips_by_categories
  end
  
  def show
    @category = Category.find_by_id(params[:id])
    if !@category
      flash[:error] = 'That category does not exist.'
      redirect_to admin_categories_path
    else
      @category_tips = @category.tips
    end
  end

  def new
    @categories = Category.all
  end

  def create
    @category = Category.create params[:category]
    if @category and @category.id
      flash[:notice] = "#{@category.name} was successfully created."
      redirect_to admin_categories_path 
    else
      # Category create failed, redirect back to "new" view
      flash[:error] = "Category creation failed."
      redirect_to new_admin_category_path
    end
  end

  def edit
	@category = Category.find_by_id params[:id]
	@categories = Category.all
  end

  def update
    @category = Category.find_by_id params[:id]
    if @category
      valid_update = @category.update_attributes params[:category]
      if !valid_update
        flash[:error] = "Couldn't update #{@category.name}."
        redirect_to edit_admin_category_path
      else
        flash[:notice] = "#{@category.name} was successfully updated."
        redirect_to edit_tips_admin_category_path @category
      end
    else
      # Couldn't find the category, redirect to the index page with an error
      flash[:error] = "That category does not exist."
      redirect_to admin_categories_path
    end
  end

  def edit_tips
    @category = Category.find_by_id params[:id]
    if @category
      # Fetch the current tips under this category for display
      @all_tips = Tip.all
      @tips = CategoryTip.find_all_by_category_id(params[:id])
    else
      # Couldn't find the category, redirect to the index page with an error
      flash[:error] = "That category does not exist."
      redirect_to admin_categories_path
    end
  end

  def update_tips
    @category = Category.find_by_id params[:id]
    if @category
      if params[:tips]
        # Remove all tips with this category's id.
        CategoryTip.destroy_all :category_id => @category.id
        # Create a new CategoryTip entry for each checked tip
        params[:tips].each do |tip|
          CategoryTip.create :tip_id => tip[0].to_i, :category_id => @category.id
        end
      end
      flash[:notice] = "#{@category.name} tips successfully updated."
      redirect_to admin_category_path @category
    else
      # Couldn't find the category, redirect to the index page with an error
      flash[:error] = "That category does not exist."
      redirect_to admin_categories_path
    end
  end

  def destroy
    @category = Category.find_by_id params[:id]
    if @category
      if @category.destroy
        flash[:notice] = "Category '#{@category.name}' deleted."
        redirect_to admin_categories_path
      else
        flash[:error] = "Sorry, you aren't strong enough to destroy this category."
        redirect_to edit_admin_category_path
      end
    else
      # category was not found
      flash[:error] = "That category does not exist."
      redirect_to admin_categories_path
    end
  end

end
