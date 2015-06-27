class TopicsController < ApplicationController
  def create
    @topic = Topic.new(topic_params)

    @demand = Demand.find(params[:demand_id])
    @topic.demand = @demand
    if @topic.save
      flash[:success] = "Topic created"
      redirect_to @topic.demand
    else
      flash[:error] = "Topic not created"
      redirect_to @topic.demand
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    @demand = @topic.demand
    Topic.find(params[:id]).destroy
    flash[:success] = "Topic deleted"
    redirect_to @demand
  end
  def send_topic
    @topic = Topic.find(params[:topic_id])
    @topic.sent = params[:sent]
    @topic.save
    redirect_to @topic.demand
  end
  private

  def topic_params
    params.require(:topic).permit(:demand_id, :description, :category, :notes)
  end

end
