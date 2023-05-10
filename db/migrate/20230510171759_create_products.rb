class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :string
      t.text :description
      t.decimal :price
      t.integer :quantity
      t.references :restaurant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
