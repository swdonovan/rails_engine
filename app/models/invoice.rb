class Invoice < ApplicationRecord
  belongs_to :customer
  belongs_to :merchant
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items

  scope :shipped, -> { where(status: 'shipped') }
  
  def self.random
    order("RANDOM()").first
  end

end
