class CreateLakes < ActiveRecord::Migration[8.1]
  def change
    create_table :lakes do |t|
      t.string :name
      t.string :region
      t.float :latitude
      t.float :longitude
      t.jsonb :fish_data
      t.jsonb :lure_data
      t.text :description

      t.timestamps
    end
  end
end
