class CreateStatusInvoiceHistories < ActiveRecord::Migration[5.0]
  def change
    create_table :status_invoice_histories do |t|
      t.string :time
      t.integer :status
      t.references :invoice, foreign_key: true

      t.timestamps
    end
  end
end
