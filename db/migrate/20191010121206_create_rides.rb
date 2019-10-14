class CreateRides < ActiveRecord::Migration[6.0]
  def change
    create_table :rides do |t|
      t.bigint :employee_id, null: false, index: true
      t.bigint :bike_id, null: false, index: true
      t.datetime :start_at, null: false
      t.datetime :end_at, null: false, index: true

      t.timestamps
    end
    add_index :rides, [:bike_id, :start_at], unique: true
  end
end
