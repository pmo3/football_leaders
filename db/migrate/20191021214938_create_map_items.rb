class CreateMapItems < ActiveRecord::Migration[6.0]
  def change
    create_table :map_items do |t|
      t.references :league, null: false, foreign_key: true
      t.integer :size

      t.timestamps
    end
  end
end
