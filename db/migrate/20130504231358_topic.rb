class Topic < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :name
      t.text :obituaries
      t.timestamps
    end
  end
end
