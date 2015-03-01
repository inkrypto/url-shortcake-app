class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.integer :link_id
      t.string :ip_address

      t.timestamps null: false
    end
  end
end
