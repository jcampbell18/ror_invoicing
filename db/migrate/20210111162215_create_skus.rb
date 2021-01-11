class CreateSkus < ActiveRecord::Migration[6.1]
  def change
    create_table :skus do |t|
      t.string :name, limit: 50
      t.string :description, limit: 250

      t.timestamps
    end
  end
end
