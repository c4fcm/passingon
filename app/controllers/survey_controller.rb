class SurveyController < ApplicationController
  def read
    obituary_id = params[:obituary_id]
    topic = params[:topic]
    session_id = request.session_options[:id]
 
    obituary = Obituary.find_by_nyt_id(obituary_id)
    render nil and return if obituary.nil?

    topic = Topic.find_by_name(topic)
    render nil and return if topic.nil?

    @obit_response = ObituaryResponse.where(:obituary_id=>obituary.id, :topic_id=>topic.id, :session_id=>session_id)

    if @obit_response.size == 0
      @obit_response = ObituaryResponse.create({:obituary=>obituary, :topic=>topic, :session_id=>session_id})
    end

    @obit_response.read = true
    @obit_response.save
  end

  def does_wikipedia_include
    render nil and return if !@request.post? 

    obituary_id = params[:id]
    topic = params[:topic]
    session_id = session[:id]
    wikipedia_result = params[:does_wikipedia_include]

    obituary = Obituary.find_by_nyt_id(obituary_id)
    render nil and return if obituary.nil?

    topic = Topic.find_by_name(topic)
    render nil and return if topic.nil?

    obit_response = ObituaryResponse.where(:obituary=>obituary, :topic=>topic, :session_id=>session_id)

    if obit_response.nil?
      obit_response = ObituaryResponse.create!({:obituary=>obituary, :topic=>topic, :session_id=>session_id})
    end

    obit_response.read = true

    # TODO: Fetch and save Form Data

  end
 
  def does_publication_include
    render nil and return if !@request.post? 
    obituary_id = params[:id]
    topic = params[:topic]
    session_id = session[:id]
    publication_result = params[:does_publication_include]

    obituary = Obituary.find_by_nyt_id(obituary_id)
    render nil and return if obituary.nil?

    topic = Topic.find_by_name(topic)
    render nil and return if topic.nil?

    obit_response = ObituaryResponse.find({:obituary=>obituary, :topic=>topic, :session_id=>session_id})

    if obit_response.nil?
      obit_response = ObituaryResponse.create!({:obituary=>obituary, :topic=>topic, :session_id=>session_id})
    end

    obit_response.read = true

    # TODO: Fetch and save Form Data

  end

end
