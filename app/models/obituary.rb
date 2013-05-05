class Obituary < ActiveRecord::Base
  attr_accessible :nyt_id
  has_many :obituary_responses
end

