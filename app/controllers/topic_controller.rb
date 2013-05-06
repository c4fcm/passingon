class TopicController < ApplicationController
  def crowd_statuses
    topic = Topic.find_by_name(params[:id])
    @crowd_statuses = []
  
    topic.all_obituaries.each do |obituary|
      @crowd_statuses << obituary.get_crowd_status if !obituary.nil?
    end
    respond_to do |format|
      format.json{
        return :json=>@crowd_statuses
      }
    end
  end
end
