require 'json'

class Topic < ActiveRecord::Base
  attr_accessible :obituaries, :name
  has_many :obituary_responses

  def all_obituaries
    Obituary.find(:all, :conditions=>['nyt_id IN (?)', JSON.parse(self.obituaries)])
  end
end

