class DemandsController < ApplicationController

  def index
    @demands = Demand.all
  end

  def new
    @demand = Demand.new
  end

  def create
    demand = Demand.new(demand_params)
    if demand.save
      redirect_to demand
    else
      render 'new'
    end
  end

  def show
    @demand = Demand.find(params[:id])
    @topics = @demand.topics
    @topic = Topic.new
  end

  def new_topic
    
  end

  private

  def demand_params
    params.require(:demand).permit(:name, :description)
  end

end
