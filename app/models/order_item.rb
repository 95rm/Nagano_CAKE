class OrderItem < ApplicationRecord
  enum making_status: { not_manufactured: 0, waiting_manufactured: 1, production: 2, completion_preparation: 3 }


  belongs_to :order
  belongs_to :item

  def subtotal
    item.with_tax_price*number
  end

  def with_tax_price
    (unit_price*1.1).floor
  end

end
