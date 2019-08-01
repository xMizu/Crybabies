class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
    @complaints = @topic.complaints
  end

  def create
  
  end
  
end
