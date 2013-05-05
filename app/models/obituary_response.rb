class ObituaryResponse < ActiveRecord::Base
  attr_accessible :read, :session_id, :wikipedia_includes, :wikipedia_needed, :does_wikipedia_include, :dos_publication_include
  has_one :topic
  has_one :obituary
end

