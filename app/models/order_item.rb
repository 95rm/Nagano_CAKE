class OrderItem < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum payment_method: { waiting_payment: 0, payment_confirmation: 1, production: 2, shipping_preparation: 3, sent: 4 }

end
