class InvoiceItem < ActiveRecord::Base

  validates_presence_of :item_id,
                        :invoice_id,
                        :quantity,
                        :price

  def calculate_total_price
  
  end
end
