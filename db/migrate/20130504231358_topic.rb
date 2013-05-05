class Topic < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.text :obituaries
      t.timestamps
    end
  end
end
