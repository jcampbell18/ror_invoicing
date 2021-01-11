class CreateAccessLevels < ActiveRecord::Migration[6.1]
  def change
    create_table :access_levels do |t|
      t.string :name, limit: 50
      t.string :description, limit: 250

      t.timestamps
    end
  end
end
