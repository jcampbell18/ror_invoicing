require "application_system_test_case"

class InvoicesTest < ApplicationSystemTestCase
  setup do
    @invoice = invoices(:one)
  end

  test "visiting the index" do
    visit invoices_url
    assert_selector "h1", text: "Invoices"
  end

  test "creating a Invoice" do
    visit invoices_url
    click_on "New Invoice"

    fill_in "Actual net", with: @invoice.actual_net
    fill_in "Amount", with: @invoice.amount
    fill_in "Bid", with: @invoice.bid_id
    fill_in "Company", with: @invoice.company_id
    fill_in "Complete", with: @invoice.complete
    fill_in "Description", with: @invoice.description
    fill_in "End date", with: @invoice.end_date
    fill_in "Image", with: @invoice.image_id
    fill_in "Images", with: @invoice.images
    fill_in "Interest amount", with: @invoice.interest_amount
    fill_in "Interest paid", with: @invoice.interest_paid
    fill_in "Loan amount", with: @invoice.loan_amount
    fill_in "Loan paid", with: @invoice.loan_paid
    fill_in "Mileage", with: @invoice.mileage_id
    fill_in "Paid", with: @invoice.paid
    fill_in "Paid checknum", with: @invoice.paid_checknum
    fill_in "Paid date", with: @invoice.paid_date
    fill_in "Project cost", with: @invoice.project_cost
    fill_in "Project site", with: @invoice.project_site_id
    fill_in "Receipts", with: @invoice.receipts
    fill_in "Save tax", with: @invoice.save_tax
    fill_in "Sku", with: @invoice.sku_id
    fill_in "Start date", with: @invoice.start_date
    fill_in "Term", with: @invoice.term_id
    click_on "Create Invoice"

    assert_text "Invoice was successfully created"
    click_on "Back"
  end

  test "updating a Invoice" do
    visit invoices_url
    click_on "Edit", match: :first

    fill_in "Actual net", with: @invoice.actual_net
    fill_in "Amount", with: @invoice.amount
    fill_in "Bid", with: @invoice.bid_id
    fill_in "Company", with: @invoice.company_id
    fill_in "Complete", with: @invoice.complete
    fill_in "Description", with: @invoice.description
    fill_in "End date", with: @invoice.end_date
    fill_in "Image", with: @invoice.image_id
    fill_in "Images", with: @invoice.images
    fill_in "Interest amount", with: @invoice.interest_amount
    fill_in "Interest paid", with: @invoice.interest_paid
    fill_in "Loan amount", with: @invoice.loan_amount
    fill_in "Loan paid", with: @invoice.loan_paid
    fill_in "Mileage", with: @invoice.mileage_id
    fill_in "Paid", with: @invoice.paid
    fill_in "Paid checknum", with: @invoice.paid_checknum
    fill_in "Paid date", with: @invoice.paid_date
    fill_in "Project cost", with: @invoice.project_cost
    fill_in "Project site", with: @invoice.project_site_id
    fill_in "Receipts", with: @invoice.receipts
    fill_in "Save tax", with: @invoice.save_tax
    fill_in "Sku", with: @invoice.sku_id
    fill_in "Start date", with: @invoice.start_date
    fill_in "Term", with: @invoice.term_id
    click_on "Update Invoice"

    assert_text "Invoice was successfully updated"
    click_on "Back"
  end

  test "destroying a Invoice" do
    visit invoices_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Invoice was successfully destroyed"
  end
end
