class CreateImages < ActiveRecord::Migration[6.1]
  def change
    create_table :images do |t|
      t.references :image_type, null: false, foreign_key: true
      t.string :filename, limit: 250
      t.string :title, limit: 75
      t.text :file_path

      t.timestamps
    end
  end
end
