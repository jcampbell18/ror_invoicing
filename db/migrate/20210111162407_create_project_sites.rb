class CreateProjectSites < ActiveRecord::Migration[6.1]
  def change
    create_table :project_sites do |t|
      t.string :address, limit: 100
      t.string :city, limit: 50
      t.references :state, null: false, foreign_key: true
      t.string :zipcode, limit: 6
      t.string :access_code, limit: 10
      t.text :map_link

      t.timestamps
    end
  end
end
