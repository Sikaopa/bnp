class CreateBoats < ActiveRecord::Migration[7.0]
  def change
    create_table :boats do |t|
      t.string :make
      t.integer :capacity
      t.string :color
      t.string :location
      t.integer :daily_rate
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
