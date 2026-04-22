class CreateFishingTrips < ActiveRecord::Migration[8.1]
  def change
    create_table :fishing_trips do |t|
      t.references :lake, null: false, foreign_key: true
      t.string :custom_location_name
      t.float :latitude
      t.float :longitude
      t.string :fish_species
      t.string :lure_used
      t.date :date_fished
      t.text :notes

      t.timestamps
    end
  end
end
