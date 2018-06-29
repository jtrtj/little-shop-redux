class Invoice < ActiveRecord::Base
  has_many :invoice_items

  validates_presence_of :merchant_id,
                        :status              
end
