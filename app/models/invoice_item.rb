class InvoiceItem < ActiveRecord::Base
  validates_presence_of :item_id,
                        :invoice_id,
                        :quantity,
                        :price

  belongs_to :invoice
  belongs_to :item
end
