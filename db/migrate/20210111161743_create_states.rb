class CreateStates < ActiveRecord::Migration[6.1]
  def change
    create_table :states do |t|
      t.string :name, limit: 75
      t.string :abbreviation, limit: 4

      t.timestamps
    end
  end
end
