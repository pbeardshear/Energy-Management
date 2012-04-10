class Admin::TipsController < ApplicationController
  layout 'admin'

  def index
    @tips = Tip.all
  end

  def show
    @tip = Tip.find params[:id]
  end

  def new
  end

  def create
    @tip = Tip.create! params[:tip]
    flash[:notice] = "#{@tip.title} was sucessfully created."
    redirect_to admin_tips_path
  end

  def edit
    @tip = Tip.find params[:id]
    @categories = Category.all()
    # @categories.delete(@tip.category)
  end

  def update
    p params[:tip]
    @tip = Tip.find params[:id]
    @tip.update_attributes! params[:tip]
    @tip.save
    p @tip
    flash[:notice] = "#{@tip.title} was succuessfully updated."
    redirect_to admin_tip_path(@tip)
  end

  def destroy
    @tip = Tip.find params[:id]
    @tip.destroy
    flash[:notice] = "Tip '#{@tip.title}' deleted"
    redirect_to admin_tips_path
  end

end
