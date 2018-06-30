class Item < ActiveRecord::Base
  validates_presence_of :title,
                        :description,
                        :price,
                        :merchant_id,
                        :image

  belongs_to :merchant
end
