require "test_helper"

class InvoicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @invoice = invoices(:one)
  end

  test "should get index" do
    get invoices_url
    assert_response :success
  end

  test "should get new" do
    get new_invoice_url
    assert_response :success
  end

  test "should create invoice" do
    assert_difference('Invoice.count') do
      post invoices_url, params: { invoice: { actual_net: @invoice.actual_net, amount: @invoice.amount, bid_id: @invoice.bid_id, company_id: @invoice.company_id, complete: @invoice.complete, description: @invoice.description, end_date: @invoice.end_date, image_id: @invoice.image_id, images: @invoice.images, interest_amount: @invoice.interest_amount, interest_paid: @invoice.interest_paid, loan_amount: @invoice.loan_amount, loan_paid: @invoice.loan_paid, mileage_id: @invoice.mileage_id, paid: @invoice.paid, paid_checknum: @invoice.paid_checknum, paid_date: @invoice.paid_date, project_cost: @invoice.project_cost, project_site_id: @invoice.project_site_id, receipts: @invoice.receipts, save_tax: @invoice.save_tax, sku_id: @invoice.sku_id, start_date: @invoice.start_date, term_id: @invoice.term_id } }
    end

    assert_redirected_to invoice_url(Invoice.last)
  end

  test "should show invoice" do
    get invoice_url(@invoice)
    assert_response :success
  end

  test "should get edit" do
    get edit_invoice_url(@invoice)
    assert_response :success
  end

  test "should update invoice" do
    patch invoice_url(@invoice), params: { invoice: { actual_net: @invoice.actual_net, amount: @invoice.amount, bid_id: @invoice.bid_id, company_id: @invoice.company_id, complete: @invoice.complete, description: @invoice.description, end_date: @invoice.end_date, image_id: @invoice.image_id, images: @invoice.images, interest_amount: @invoice.interest_amount, interest_paid: @invoice.interest_paid, loan_amount: @invoice.loan_amount, loan_paid: @invoice.loan_paid, mileage_id: @invoice.mileage_id, paid: @invoice.paid, paid_checknum: @invoice.paid_checknum, paid_date: @invoice.paid_date, project_cost: @invoice.project_cost, project_site_id: @invoice.project_site_id, receipts: @invoice.receipts, save_tax: @invoice.save_tax, sku_id: @invoice.sku_id, start_date: @invoice.start_date, term_id: @invoice.term_id } }
    assert_redirected_to invoice_url(@invoice)
  end

  test "should destroy invoice" do
    assert_difference('Invoice.count', -1) do
      delete invoice_url(@invoice)
    end

    assert_redirected_to invoices_url
  end
end
