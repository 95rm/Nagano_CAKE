class OrderItem < ApplicationRecord
  enum status: { not_manufactured: 0, waiting_manufactured: 1, production: 2, completion_preparation: 3 }


  belongs_to :order
  belongs_to :item

end
