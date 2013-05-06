class ObituaryResponse < ActiveRecord::Base
  attr_accessible :read, :session_id, :wikipedia_includes, :wikipedia_needed, :does_wikipedia_include, :dos_publication_include, :topic, :obituary, :topic_id, :obituary_id
  has_one :topic
  has_one :obituary
end

