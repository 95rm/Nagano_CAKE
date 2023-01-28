class Order < ApplicationRecord
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { waiting_payment: 0, payment_confirmation: 1, production: 2, shipping_preparation: 3, sent: 4 }

  belongs_to :costomer
  has_many :order_items

end
