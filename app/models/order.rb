class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_details, dependent: :destroy

  enum payment_method: { credit_card: 0, transfer: 1 }
  enum order_status: { waiting_for_payment: 1, payment_confirmation: 2, in_production:3, preparing_to_ship:4, sent:5 }

end
