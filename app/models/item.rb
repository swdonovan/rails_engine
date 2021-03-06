class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items


  def self.random
    order("RANDOM()").first
  end


  def self.most_revenue(top_x = 5)
    self.find_by_sql("SELECT items.*, sum(invoice_items.quantity * invoice_items.unit_price) as revenue
                      FROM items
                      INNER JOIN invoice_items on items.id = invoice_items.item_id
                      INNER JOIN invoices on invoices.id = invoice_items.invoice_id
                      WHERE invoices.status = 'shipped'
                      GROUP BY items.id
                      ORDER BY revenue DESC
                      LIMIT #{top_x}")
  end

  def self.most_items_sold(top_x = 5)
    self.find_by_sql("SELECT items.*, sum(invoice_items.quantity) AS top_sold
                      FROM items
                      INNER JOIN invoice_items ON items.id = invoice_items.item_id
                      INNER JOIN invoices ON invoices.id = invoice_items.invoice_id
                      WHERE invoices.status = 'shipped'
                      GROUP BY items.id
                      ORDER BY top_sold DESC
                      LIMIT #{top_x}")
  end

  def self.best_day(id)
    self.find_by_sql("

    ")
  end


end
