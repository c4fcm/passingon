class ObituaryResponses < ActiveRecord::Migration
  def change
    create_table :obituary_responses do |t|
      t.boolean :wikipedia_includes
      t.boolean :wikipedia_needed
      t.boolean :read
      t.string :session_id
      t.integer :topic_id
      t.text :does_wikipedia_include
      t.text :does_publication_include
      t.integer :obituary_id
      t.timestamps
    end
  end
end
