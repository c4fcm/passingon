class Obituary < ActiveRecord::Migration
  def change
    create_table :obituaries do |t|
      t.string :nyt_id
      t.timestamps
    end
  end
end
