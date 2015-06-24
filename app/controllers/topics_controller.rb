class TopicsController < ApplicationController
  def create
    @topic = Topic.new(topic_params)
    @demand = Demand.find(params[:demand_id])
    @topic.demand = @demand
    if @topic.save
      redirect_to @topic.demand
    else
      redirect_to demands_path
    end
  end

  def destroy
    Topic.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to demands_path
  end

  private

  def topic_params
    params.require(:topic).permit(:demand_id, :description, :category, :notes)
  end

end
