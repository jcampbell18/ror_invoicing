json.extract! expense, :id, :invoice_id, :company_id, :expense_category_id, :vehicle_id, :pdate, :name, :quantity, :amount, :subtotal, :tax_include, :tax, :total, :receipt_reference, :image_id, :created_at, :updated_at
json.url expense_url(expense, format: :json)
