class Obituary < ActiveRecord::Base
  attr_accessible :nyt_id
  has_many :obituary_responses
 
  def get_crowd_status
    cs = {
      :read=>0,
      :nytimes_view=>0,
      :wikipedia_includes=>0,
      :wikipedia_needed=>0,
      :publications=>{},
      :id=>self.nyt_id
    }
    self.obituary_responses.each do |response|
      cs[:read] += 1 if response.read
      cs[:nytimes_view] += 1 if response.nytimes_view
      cs[:wikipedia_includes] += 1 if response.wikipedia_includes
      cs[:wikipedia_needed] += 1 if response.wikipedia_needed
      if(!response.does_publication_include.nil?)
        pubs = JSON.parse(response.does_publication_include)
        if !pubs.nil? and pubs.class  == Array and pubs.size > 0
          pubs.each do |pub|
            if pub.key? "publication"
              if !cs[:publications].has_key? pub["publication"]
                #cs[:publications][pub["publication"]] = [pub]
                cs[:publications][pub["publication"]] = 0
              else
                cs[:publications][pub["publication"]] +=1
              end
            end
          end
        end
      end
    end
    cs
  end
end

