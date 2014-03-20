class ChangeTopicObituariesToMediumtext < ActiveRecord::Migration
  def change
    change_column :topics, :obituaries, :text, :limit => 16777215
  end
end
