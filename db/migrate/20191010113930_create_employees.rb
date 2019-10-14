class CreateEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|
      t.string :name, limit: 100, null: false
      
      t.timestamps
      t.datetime :discarded_at, index: true
    end
  end
end
