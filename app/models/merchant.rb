class Merchant < ActiveRecord::Base
  validates_presence_of :name

  has_many :items

  def total_merchant_items
    items.count
  end

  def average_item_price
    items.average(:price)
  end

  def total_price_all_items
    items.sum(:price)
  end

  def self.most_items
    all.max_by do |merchant|
      merchant.total_merchant_items
    end
  end

  def self.highest_priced_item

  end
end
