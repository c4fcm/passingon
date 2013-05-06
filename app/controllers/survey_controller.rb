class SurveyController < ApplicationController
  def read
    #obituary_id = params[:obituary_id]
    #topic_name = params[:topic]
    #session_id = request.session_options[:id]
 
    #obituary = Obituary.find_by_nyt_id(obituary_id)
    #render nil and return if obituary.nil?

    #@topic = Topic.find_by_name(topic_name)
    #render nil and return if @topic.nil?

    #@obit_response = ObituaryResponse.where(:obituary_id=>obituary.id, :session_id=>session_id)

    #if @obit_response.size == 0
    #  @obit_response = ObituaryResponse.create({:obituary=>obituary, :session_id=>session_id})
    #end
    load_obit_response params

    @obit_response.read = true
    @obit_response.save
  end

  def does_wikipedia_include
    render nil and return if !@request.post? 
    load_obit_response params

    # TODO: Fetch and save Form Data

  end
 
  def does_publication_include
    render nil and return if !@request.post? 
    load_obit_response params

    # TODO: Fetch and save Form Data
  end

  protected
  def load_obit_response params
    obituary_id = params[:obituary_id]
    topic_name = params[:topic]
    session_id = request.session_options[:id]

    obituary = Obituary.find_by_nyt_id(obituary_id)
    render nil and return if obituary.nil?

    @topic = Topic.find_by_name(topic_name)
    render nil and return if @topic.nil?

    @obit_response = ObituaryResponse.where(:obituary_id=>obituary.id, :session_id=>session_id)

    if @obit_response.size == 0
      @obit_response = ObituaryResponse.create({:obituary=>obituary, :session_id=>session_id})
    end
  end

end
