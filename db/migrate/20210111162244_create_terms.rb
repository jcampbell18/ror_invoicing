class CreateTerms < ActiveRecord::Migration[6.1]
  def change
    create_table :terms do |t|
      t.string :name, limit: 150

      t.timestamps
    end
  end
end
