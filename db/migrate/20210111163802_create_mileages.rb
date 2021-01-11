class CreateMileages < ActiveRecord::Migration[6.1]
  def change
    create_table :mileages do |t|
      t.references :project_site, null: false, foreign_key: true
      t.references :vehicle, null: false, foreign_key: true
      t.references :invoice, null: false, foreign_key: true
      t.date :drive_date
      t.decimal :start_mileage, precision: 7, scale: 1
      t.decimal :end_mileage, precision: 7, scale: 1
      t.decimal :subtotal, precision: 7, scale: 1
      t.string :notes, limit: 150

      t.timestamps
    end
  end
end
