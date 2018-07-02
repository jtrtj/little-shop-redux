class Invoice < ActiveRecord::Base
  validates_presence_of :merchant_id,
                        :status      
                
  has_many :invoice_items
  belongs_to :merchant

  def total_price
    invoice_items.map do |invoice_item|
      invoice_item.quantity * invoice_item.unit_price
    end.inject(:+)
  end

  def total_quantity
    invoice_items.inject(0) do |total, invoice_item|
      total += invoice_item.quantity
    end
  end

  def self.amount_by_status(status)
    where(status: status).length
  end

  def self.percentage_by_status(status)
    ((amount_by_status(status).to_f / count).round(2)) * 100
  end

  def self.invoice_with_highest_total
    all.max_by do |invoice|
      invoice.total_price
    end
  end

  def self.invoice_with_lowest_total
    all.min_by do |invoice|
      invoice.total_price
    end
  end

  def self.invoice_with_highest_quantity
    find(InvoiceItem.find_invoice_item_with_highest_quantity_invoice_id)
  end

  def self.invoice_with_lowest_quantity
    find(InvoiceItem.find_invoice_item_with_lowest_quantity_invoice_id)
  end
end