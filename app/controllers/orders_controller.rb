class OrdersController < ApplicationController
    
  before_action :authenticate_user!, only: [:submit]
    SUCCESS_MESSAGE = 'Thank you for your order.'
    FAILURE_MESSAGE = 'Oops something went wrong. Please call the administrator'
    CASH_MESSAGE = 'Please call us at 888-888-888 to pay by cash.'
    
    def landingpage
      if user_signed_in?
        redirect_to '/orders'
      end
    end
    
    def index
      products = Product.all
      @products_purchase = products.where(stripe_plan_name:nil)
    
    puts ENV['STRIPE_SECRET_KEY']

    end
  
    def submit
        @order = Order.new(order_params)
        #Check which type of order it is
        if order_params[:payment_gateway] == "stripe"
          prepare_new_order
          Orders::Stripe.execute(order: @order, user: current_user)
        else 
          return render html: CASH_MESSAGE
        end
      ensure
        if @order&.save
          
          if @order.failed? && !@order.error_message.blank?
            # Render error only if order failed and there is an error_message
            return render html: @order.error_message

          elsif @order.paid?
              # Success is rendere when order is paid and saved
              return render html: SUCCESS_MESSAGE
          end
        end
        render html: FAILURE_MESSAGE
      end

    private
        # Initialize a new order and and set its user, product and price.
        def prepare_new_order
        @order = Order.new(order_params)
        @order.user_id = current_user.id
        @product = Product.find(params[:orders][:product_id])
        @order.product = @product
        @order.price_cents = @product.price_cents
        end
    
        def order_params
        params.require(:orders).permit(:product_id, :token, :payment_gateway, :charge_id)
        end
    end