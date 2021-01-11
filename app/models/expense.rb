class Expense < ApplicationRecord
  belongs_to :invoice
  belongs_to :company
  belongs_to :expense_category
  belongs_to :vehicle
  belongs_to :image
end
