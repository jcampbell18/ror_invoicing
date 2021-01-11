class Mileage < ApplicationRecord
  belongs_to :project_site
  belongs_to :vehicle
  belongs_to :invoice
end
