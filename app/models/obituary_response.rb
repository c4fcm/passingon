class ObituaryResponse < ActiveRecord::Base
  attr_accessible :read, :session_id, :wikipedia_includes, :wikipedia_needed, :does_wikipedia_include, :dos_publication_include, :topic, :obituary, :topic_id, :obituary_id
  belongs_to :topic
  belongs_to :obituary
end

