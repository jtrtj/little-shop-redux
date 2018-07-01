class InvoiceItem < ActiveRecord::Base
  validates_presence_of :item_id,
                        :invoice_id,
                        :quantity,
                        :unit_price

  belongs_to :invoice
  belongs_to :item

  def self.find_invoice_item_with_highest_unit_price_invoice_id
    list_by_unit_price_desc.first.invoice_id
  end
  
  def self.find_invoice_item_with_lowest_unit_price_invoice_id
    list_by_unit_price_desc.last.invoice_id
  end
  
  def self.list_by_unit_price_desc
    order(unit_price: :desc)
  end
end
