class Invoice < ActiveRecord::Base
  validates_presence_of :merchant_id,
                        :status      
                
  has_many :invoice_items
  belongs_to :merchant

  def total_price
    invoice_items.map do |invoice_item|
      invoice_item.quantity * invoice_item.unit_price
    end.inject(:+)
  end

  def highest_priced_invoice_item
    invoice_items.order(unit_price: :desc).first
  end

  def self.amount_by_status(status)
    where(status: status).length
  end

  def self.percentage_by_status(status)
    ((amount_by_status(status).to_f / count).round(2)) * 100
  end

  def self.invoice_with_highest_unit_price
    
  end
end