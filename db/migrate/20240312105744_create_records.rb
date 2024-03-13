class CreateRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :records do |t|
      t.references :buyer, null: false,foreign_key:{ to_table: :users }
      t.references :item, null: false,foreign_key: true
      t.timestamps
    end
  end
end
