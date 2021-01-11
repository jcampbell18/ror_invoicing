class CreateExpenseCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :expense_categories do |t|
      t.string :name, limit: 50
      t.string :description, limit: 250

      t.timestamps
    end
  end
end
