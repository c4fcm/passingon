class TopicController < ApplicationController
  def crowd_statuses
    topic = Topic.find_by_name(params[:id])
    @crowd_statuses = []
  
    topic.all_obituaries.each do |obituary|
      crowd_status = obituary.get_crowd_status
      @crowd_statuses << crowd_status if crowd_status[:read] == 1
    end
    respond_to do |format|
      format.html{
        render :layout=> false
      }
      format.json{
        render :json=>@crowd_statuses
      }
    end
  end
end
