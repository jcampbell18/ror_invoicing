class Invoice < ApplicationRecord
  belongs_to :company
  belongs_to :project_site
  belongs_to :sku
  belongs_to :bid
  belongs_to :term
end
