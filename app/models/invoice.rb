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
end