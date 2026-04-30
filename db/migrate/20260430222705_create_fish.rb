class CreateFish < ActiveRecord::Migration[8.1]
  def change
    create_table :fish do |t|
      t.string :name
      t.string :species

      t.timestamps
    end
  end
end
