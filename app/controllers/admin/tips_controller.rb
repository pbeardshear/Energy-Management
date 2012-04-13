class Admin::TipsController < ApplicationController
  layout 'admin'

  def index
    @tips = Tip.all
  end

  def show
    @tip = Tip.find params[:id]
  end

  def new
    @categories = Category.all
  end

  def create
    @tip = Tip.create! params[:tip]
    if params[:categories]
      params[:categories].each do |name|
        # checked is always "1" in here, i.e. only checked categories are passed
        CategoryTip.create! :tip_id => @tip.id, :category_id => Category.find_by_name(name).id
      end
    end
    flash[:notice] = "#{@tip.title} was sucessfully created."
    redirect_to admin_tips_path
  end

  def edit
    @tip = Tip.find params[:id]
    @categories = Category.all
  end

  def update
    @tip = Tip.find params[:id]
    
    # categories = params[:categories].each { |category|
    #  Category.where(:name => category).first
    # }
    # @tip.categories = categories
    # This throws an error, but I am not sure why
    @tip.update_attributes! params[:tip]

    flash[:notice] = "#{@tip.title} was succuessfully updated."
    redirect_to admin_tip_path @tip
  end

  def destroy
    @tip = Tip.find params[:id]
    @tip.destroy
    flash[:notice] = "Tip '#{@tip.title}' deleted"
    redirect_to admin_tips_path
  end

end
