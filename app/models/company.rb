class Company < ApplicationRecord
  belongs_to :company_category
  belongs_to :state
  belongs_to :image
end
