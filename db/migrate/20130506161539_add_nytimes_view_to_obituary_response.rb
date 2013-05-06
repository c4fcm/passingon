class AddNytimesViewToObituaryResponse < ActiveRecord::Migration
  def change
    add_column :obituary_responses, :nytimes_view, :boolean
  end
end
