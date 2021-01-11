class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username, limit: 50
      t.string :password, limit: 250
      t.references :access_level, null: false, foreign_key: true
      t.references :company, null: false, foreign_key: true
      t.string :name, limit: 50
      t.string :phone, limit: 14
      t.string :phone_ext, limit: 6
      t.string :email, limit: 100

      t.timestamps
    end
  end
end
