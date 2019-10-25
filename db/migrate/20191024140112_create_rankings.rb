class CreateRankings < ActiveRecord::Migration[6.0]
  def change
    create_table :rankings do |t|
      t.references :team, null: false, foreign_key: true
      t.references :league, null: false, foreign_key: true
      t.integer :rank
      t.date :date, default: Date.today
      t.integer :points

      t.timestamps
    end
  end
end
