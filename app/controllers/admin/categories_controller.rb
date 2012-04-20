class Admin::CategoriesController < ApplicationController
  before_filter :authenticate_user!
  layout 'admin'

  def index
    @categories = Category.all
  end
  
  def show
    @category = Category.find_by_id(params[:id])
    if !@category
      flash[:error] = 'That category does not exist.'
      redirect_to categories_path
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
      # tip create failed, redirect back to "new" view
      flash[:error] = "Category creation failed."
      redirect_to new_admin_categories_path
    end
  end

  def edit
  end

  def update
    @category = Category.find_by_id params[:id]
    if @cateogory
      valid_update = @category.update_attributes params[:category]
      if !valid_update
        flash[:error] = "Couldn't update #{@category.name}"
        redirect_to edit_admin_category_path
      else
        # remove all categories with this tip's id, in lieu of adding the selected ones
        CategoryTip.destroy_all :tip_id => params[:id]
        flash[:notice] = "#{@category.name} was successfully updated."
        redirect_to admin_category_path @category
      end
    else
      # Couldn't find the tip, redirect to the index page with an error
      flash[:error] = "That tip does not exist."
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
      # tip was not found
      flash[:error] = "That tip does not exist."
      redirect_to admin_categories_path
    end
  end

  
end
