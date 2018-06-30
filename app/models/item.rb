class Item < ActiveRecord::Base
  has_many :invoice_items

  validates_presence_of :title,
                        :description,
                        :price,
                        :merchant_id,
                        :image
end
