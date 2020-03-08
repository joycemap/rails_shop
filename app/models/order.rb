class Order < ApplicationRecord
    enum status: { pending: 0, failed: 1, paid: 2}
    enum payment_gateway: { stripe: 0, cash: 1 }
    belongs_to :product
    belongs_to :user
  
    scope :recently_created, ->  { where(created_at: 1.minutes.ago..DateTime.now) }
  
    def set_paid
      self.status = Order.statuses[:paid]
    end
    def set_failed
      self.status = Order.statuses[:failed]
    end
 
  end