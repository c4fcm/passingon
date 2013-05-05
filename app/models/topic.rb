class Topic < ActiveRecord::Base
  attr_accessible :obituaries
  has_many :obituary_responses
end

