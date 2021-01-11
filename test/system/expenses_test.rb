require "application_system_test_case"

class ExpensesTest < ApplicationSystemTestCase
  setup do
    @expense = expenses(:one)
  end

  test "visiting the index" do
    visit expenses_url
    assert_selector "h1", text: "Expenses"
  end

  test "creating a Expense" do
    visit expenses_url
    click_on "New Expense"

    fill_in "Amount", with: @expense.amount
    fill_in "Company", with: @expense.company_id
    fill_in "Expense category", with: @expense.expense_category_id
    fill_in "Image", with: @expense.image_id
    fill_in "Invoice", with: @expense.invoice_id
    fill_in "Name", with: @expense.name
    fill_in "Pdate", with: @expense.pdate
    fill_in "Quantity", with: @expense.quantity
    fill_in "Receipt reference", with: @expense.receipt_reference
    fill_in "Subtotal", with: @expense.subtotal
    fill_in "Tax", with: @expense.tax
    fill_in "Tax include", with: @expense.tax_include
    fill_in "Total", with: @expense.total
    fill_in "Vehicle", with: @expense.vehicle_id
    click_on "Create Expense"

    assert_text "Expense was successfully created"
    click_on "Back"
  end

  test "updating a Expense" do
    visit expenses_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @expense.amount
    fill_in "Company", with: @expense.company_id
    fill_in "Expense category", with: @expense.expense_category_id
    fill_in "Image", with: @expense.image_id
    fill_in "Invoice", with: @expense.invoice_id
    fill_in "Name", with: @expense.name
    fill_in "Pdate", with: @expense.pdate
    fill_in "Quantity", with: @expense.quantity
    fill_in "Receipt reference", with: @expense.receipt_reference
    fill_in "Subtotal", with: @expense.subtotal
    fill_in "Tax", with: @expense.tax
    fill_in "Tax include", with: @expense.tax_include
    fill_in "Total", with: @expense.total
    fill_in "Vehicle", with: @expense.vehicle_id
    click_on "Update Expense"

    assert_text "Expense was successfully updated"
    click_on "Back"
  end

  test "destroying a Expense" do
    visit expenses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Expense was successfully destroyed"
  end
end
