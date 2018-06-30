class InvoiceItem < ActiveRecord::Base
  belongs_to :invoice
  has_many :items

  validates_presence_of :item_id,
                        :invoice_id,
                        :quantity,
                        :price

  def self.with_items
     joins(:items)
  end

end
