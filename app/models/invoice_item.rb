class InvoiceItem < ActiveRecord::Base
  belongs_to :invoice
  has_many :items

  validates_presence_of :item_id,
                        :invoice_id,
                        :quantity,
                        :price

  def calculate_total_price
  
  end

  def self.with_items
     joins(:items)
  end

end
