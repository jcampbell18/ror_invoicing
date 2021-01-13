json.extract! invoice, :id, :company_id, :project_site_id, :sku_id, :bid_id, :term_id, :start_date, :end_date, :description, :amount, :loan_amount, :loan_paid, :interest_amount, :interest_paid, :complete, :paid, :paid_checknum, :paid_date, :project_cost, :save_tax, :actual_net, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)
