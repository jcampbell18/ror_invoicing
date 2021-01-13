class CreateInvoices < ActiveRecord::Migration[6.1]
  def change
    create_table :invoices do |t|
      t.references :company, null: false, foreign_key: true
      t.references :project_site, null: false, foreign_key: true
      t.references :sku, null: false, foreign_key: true
      t.references :bid, null: false, foreign_key: true
      t.references :term, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.text :description
      t.decimal :amount, precision: 8, scale: 2
      t.decimal :loan_amount, precision: 8, scale: 2
      t.integer :loan_paid, limit: 1
      t.decimal :interest_amount, precision: 8, scale: 2
      t.integer :interest_paid, limit: 1
      t.integer :complete, limit: 1
      t.integer :paid, limit: 1
      t.string :paid_checknum, limit: 50
      t.date :paid_date
      t.decimal :project_cost, precision: 8, scale: 2
      t.decimal :save_tax, precision: 8, scale: 2
      t.decimal :actual_net, precision: 8, scale: 2

      t.timestamps
    end
  end
end
