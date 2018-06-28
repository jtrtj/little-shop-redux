require './data/*.csv'
require 'CSV'

CSV.foreach('./data/merchants.csv', headers: true, header_converters: :symbol) do |m|
  Merchant.create(id:         m[:id],
                  name:       m[:name],
                  created_at: m[:created_at],
                  updated_at: m[:updated_at]
                  )
end
