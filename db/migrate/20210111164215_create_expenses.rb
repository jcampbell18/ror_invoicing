class CreateExpenses < ActiveRecord::Migration[6.1]
  def change
    create_table :expenses do |t|
      t.references :invoice, null: false, foreign_key: true
      t.references :company, null: false, foreign_key: true
      t.references :expense_category, null: false, foreign_key: true
      t.references :vehicle, null: false, foreign_key: true
      t.date :pdate
      t.string :name, limit: 250
      t.integer :quantity, limit: 4
      t.decimal :amount, precision: 8, scale: 2
      t.decimal :subtotal, precision: 8, scale: 2
      t.integer :tax_include, limit: 1
      t.decimal :tax, precision: 8, scale: 5
      t.decimal :total, precision: 8, scale: 2
      t.string :receipt_reference, limit: 100
      t.references :image, null: false, foreign_key: true

      t.timestamps
    end
  end
end
