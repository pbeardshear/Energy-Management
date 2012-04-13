class Admin::TipsController < ApplicationController
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
    if @tip
      # Check for empty title or content fields
      if @tip.title == ""
        flash[:error] = "Please specify a title for the tip."
        # TODO: return to the "new" page and keep the form fields intact
        redirect_to new_admin_tip_path
        return
      elsif @tip.content == ""
        flash[:error] = "Please specify some content for this tip."
        # TODO: return to the "new" page and keep the form fields intact
        redirect_to new_admin_tip_path
        return
      else
        if params[:categories]
          params[:categories].each do |name|
            # checked is always "1" in here, i.e. only checked categories are passed
            CategoryTip.create :tip_id => @tip.id, :category_id => Category.find_by_name(name).id
          end
        end
        flash[:notice] = "#{@tip.title} was sucessfully created."
        redirect_to admin_tips_path
      end
    else
      # tip create failed, redirect back to "new" view
      flash[:error] = "Tip creation failed."
      redirect_to new_admin_tip_path
    end
  end

  def edit
    @tip = Tip.find params[:id]
    @categories = Category.all
  end

  def update
    @tip = Tip.find params[:id]
    if @tip
      @tip.update_attributes! params[:tip]
      
      # remove all categories with this tip's id, in lieu of adding the selected ones
      CategoryTip.destroy_all :tip_id => params[:id]
      if params[:categories]
        params[:categories].each do |name|
          # checked is always "1" in here, i.e. only checked categories are passed
          CategoryTip.create! :tip_id => params[:id], :category_id => Category.find_by_name(name).id
        end
      end
      flash[:notice] = "#{@tip.title} was succuessfully updated."
      redirect_to admin_tip_path @tip
    else
      # Couldn't find the tip, redirect to the index page with an error
      flash[:error] = "That tip does not exist."
      redirect_to admin_tips_path
    end
  end

  def destroy
    @tip = Tip.find params[:id]
    if @tip
      @tip.destroy
      flash[:notice] = "Tip '#{@tip.title}' deleted"
      redirect_to admin_tips_path
    else
      # tip was not found
      flash[:error] = "That tip does not exist."
      redirect_to admin_tips_path
    end
  end

end
