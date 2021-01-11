class CreateBids < ActiveRecord::Migration[6.1]
  def change
    create_table :bids do |t|
      t.references :company, null: false, foreign_key: true
      t.references :project_site, null: false, foreign_key: true
      t.references :sku, null: false, foreign_key: true
      t.references :bid_status, null: false, foreign_key: true
      t.date :bid_date
      t.text :description
      t.decimal :amount, precision: 6, scale: 2

      t.timestamps
    end
  end
end
