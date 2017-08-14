class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.references :invoice, foreign_key: true
      t.string :credit_card_num
      t.date :credit_card_expiration_date
      t.integer :result

      t.timestamps
    end
  end
end
