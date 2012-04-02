class HallController < ApplicationController
  def index
  end

  def show
    @script = Hall.find(id).get_graph
  end
end
