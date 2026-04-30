class CreateLures < ActiveRecord::Migration[8.1]
  def change
    create_table :lures do |t|
      t.string :name
      t.string :lure_type
      t.references :fish, null: false, foreign_key: true

      t.timestamps
    end
  end
end
