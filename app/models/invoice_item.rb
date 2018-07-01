class InvoiceItem < ActiveRecord::Base
  validates_presence_of :item_id,
                        :invoice_id,
                        :quantity,
                        :unit_price

  belongs_to :invoice
  belongs_to :item

  def self.find_invoice_item_with_highest_unit_price
    order(unit_price: :desc).first
  end
end
