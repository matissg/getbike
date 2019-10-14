class CreateBikes < ActiveRecord::Migration[6.0]
  def change
    create_table :bikes do |t|
      t.string :number, limit: 25, null: false

      t.timestamps
      t.datetime :discarded_at, index: true
    end
  end
end
