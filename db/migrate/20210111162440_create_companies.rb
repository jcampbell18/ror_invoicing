class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.references :company_category, null: false, foreign_key: true
      t.string :business_name, limit: 75
      t.string :contact_name, limit: 75
      t.string :address, limit: 75
      t.string :city, limit: 50
      t.references :state, null: false, foreign_key: true
      t.string :zipcode, limit: 6
      t.string :phone, limit: 14
      t.string :phone_ext, limit: 6
      t.string :fax, limit: 14
      t.string :email, limit: 50
      t.string :website, limit: 50
      t.references :image, null: false, foreign_key: true

      t.timestamps
    end
  end
end
