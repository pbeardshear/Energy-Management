class EmbedsController < ApplicationController
  def index
    render :js => "alert('Yo dawg, this page hall does not have friggen things yet, go away');"
  end
end
