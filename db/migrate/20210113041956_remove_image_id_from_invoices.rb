class RemoveImageIdFromInvoices < ActiveRecord::Migration[6.1]
  def change
    remove_column :invoices, :image_id, :bigint
  end
end
