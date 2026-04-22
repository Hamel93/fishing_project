class LakesController < ApplicationController
  def index
    @lakes = Lake.all
  end

  def show
    @lake = Lake.find(params[:id])
  end
end
