class ObituaryController < ApplicationController
  def crowd_status
    obituary = Obituary.find_by_nyt_id(params[:id])
    @crowd_status = {}
    @crowd_status = obituary.get_crowd_status if !obituary.nil?
    @crowd_status[:id] = obituary.nyt_id
    respond_to do |format|
      format.json{
        return :json => @crowd_status
      }
    end
  end
end
