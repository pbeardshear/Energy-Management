class Admin::TipsController < ApplicationController
  # TODO: add logic for failure, and add flash messages
  
  def index
    @tips = Tip.all
  end

  def show
    @tip = Tip.find(params[:id])
  end

  def edit
    @tip = Tip.find(params[:id])
  end

  def delete
    @tip = Tip.find(params[:id])
    # @tip.destory
    # redirect tips_index_page
  end

  def create
    @tip.new(params).save
    # redirect tips_index_page
  end

end
