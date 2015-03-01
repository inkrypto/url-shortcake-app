class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :url_name
      t.integer :link_id

      t.timestamps null: false
    end
  end
end
