class TopicsController < ApplicationController
  def index
  end

  def show
    @topic = Topic.find(params[:id])
    @complaints = @topic.complaints
  end

  def create
  
  end
  
end
