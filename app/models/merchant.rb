class Merchant < ActiveRecord::Base
  validates_presence_of :name

  has_many :items

  def total_merchant_items
    items.count
  end

  def average_item_price
  end

  def total_price_all_items
  end

  def self.most_items
  end

  def self.highest_priced_item
  end
end
