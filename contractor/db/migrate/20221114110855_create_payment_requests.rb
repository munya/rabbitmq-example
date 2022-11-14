class CreatePaymentRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :payment_requests do |t|
      t.integer :amount
      t.string :currency
      t.text :description
      t.string :status

      t.timestamps
    end
  end
end
