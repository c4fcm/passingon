class SurveyController < ApplicationController
  respond_to :json

  def read
    load_obit_response params

    @obit_response.read = true
    @obit_response.save
    respond_to do |format|
      format.html{
        render :layout=> false
      }
      format.json{
        render :json=>@obit_response.obituary.get_crowd_status
      }
    end
  end

  def get_token
    respond_to do |format|
      format.html{
        render :layout=> false
      }
      format.json{
        render :json=>{:authenticity_token=>form_authenticity_token}
      }
    end
  end

  def nytimes_view
    load_obit_response params
    @obit_response.nytimes_view = true
    @obit_response.save
    respond_to do |format|
      format.html{
        render :layout=> false
      }
      format.json{
        render :json=>@obit_response.obituary.get_crowd_status
      }
   end
  end

  def does_wikipedia_include
    load_obit_response params

    @obit_response.does_wikipedia_include = stripped_params(params)
    if params.has_key? "includes_person" and params["includes_person"] == "Y"
      @obit_response.wikipedia_includes = true 
    end

    if (params.has_key? "notable" and params["notable"] == "Y") or 
       (params.has_key? "needs_improvement" and params["needs_improvement"] == "Y")
      @obit_response.wikipedia_needed = true 
    end

    @obit_response.save

    respond_to do |format|
      format.html{
        render :layout=> false
      }
      format.json{
        render :json=>@obit_response.obituary.get_crowd_status
      }
    end
  end
 
  def does_publication_include
    load_obit_response params

    #TODO: Refactor this into the model
    @obit_response.does_publication_include = [].to_json if @obit_response.does_publication_include.nil?
    dpi_object = JSON.parse(@obit_response.does_publication_include)
    dpi_object << stripped_params(params)
    @obit_response.does_publication_include = dpi_object.to_json

    @obit_response.save

    respond_to do |format|
      format.html{
        render :layout=> false
      }
      format.json{
        render :json=>@obit_response.obituary.get_crowd_status
      }
    end
  end

  protected

  def stripped_params hash
    r = hash.dup
    r.delete("controller")
    r.delete("action")
    r.delete("authenticity_token")
    r.delete("format")
    r
  end

  def load_obit_response params
    session[:filler]=true
    obituary_id = params[:obituary_id]
    topic_name = params[:topic]
    session_id = request.session_options[:id]

    obituary = Obituary.find_by_nyt_id(obituary_id)
    render nil and return if obituary.nil?

    @topic = Topic.find_by_name(topic_name)
    render nil and return if @topic.nil?

    @obit_response = ObituaryResponse.where(:obituary_id=>obituary.id, :session_id=>session_id).first_or_create!

  end

end
