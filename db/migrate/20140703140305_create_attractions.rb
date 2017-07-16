class CreateAttractions < ActiveRecord::Migration
  def change
    create_table :attractions do |t|
      t.string :name
      t.integer :nausea_rating
      t.integer :happiness_rating
      t.integer :tickets
      t.integer :min_height
      t.integer :ride_id

      t.timestamps null: false
    end
  end
end
