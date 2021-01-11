class CreateImageTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :image_types do |t|
      t.string :name, limit: 50

      t.timestamps
    end
  end
end
