class Item < ActiveRecord::Base
  validates_presence_of :title,
                        :description,
                        :price,
                        :merchant_id,
                        :image

  has_many :invoice_items
  belongs_to :merchant
end
