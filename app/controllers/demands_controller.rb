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
      redirect_to '/demands'
    else
      flash[:error] = "Topic not created"
      redirect_to demand
    end
  end

  def show
    @demand = Demand.find(params[:id])
    @topics = @demand.topics
    @topic = Topic.new
  end

  def validate_topic
    @demand = Demand.find(params[:demand_id])
    @topics = @demand.topics.where(:sent => true)
  end

  def approve_topic
    @topic = Topic.find(params[:topic_id])
    @topic.accepted = params[:accepted]
    if @topic.accepted == false
        @topic.sent = false
    end
    @topic.save
    redirect_to '/validate_topic?demand_id='+@topic.demand.id.to_s
  end

  def validated_topics
    @demand = Demand.find(params[:demand_id])
    @topics = @demand.topics.where(:accepted => true)
  end

  def excluir_demand
    @demand = Demand.find(params[:demand_id])
    @demand.destroy
    redirect_to @demand
  end

  def new_topic_for_demand
    @demand = Demand.find(params[:id])
    @topic = @demand.topics.build
  end

  private

  def demand_params
    params.require(:demand).permit(:name, :description)
  end

end
