class Item < ActiveRecord::Base
  belongs_to :invoice_items

  validates_presence_of :title,
                        :description,
                        :price,
                        :merchant_id,
                        :image
end
