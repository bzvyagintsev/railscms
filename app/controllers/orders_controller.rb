class OrdersController < ApplicationController
  # include Wicked::Wizard

  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
    def new
      prepare_meta_tags title: ' | Оформление заказа', description: ' | Оформление заказа'

       if @cart.line_items.empty?
       redirect_to root_path,  :flash => { info: "Корзина пуста"} 
       return
      end
      
      @order = Order.new
    end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @order.add_line_items_from_cart(@cart)
    
    respond_to do |format|
      if @order.save
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil

        # OrderMailer.order_checkout(@order, @user).deliver_later
        # OrderMailer.new_order(@order).deliver_later

        # condition =  @order.payment_method.value == 'online'
        # Можно попробовать хранить заказ в сессии, и вот здесь очищать сессию заказа как и у корзины
        # Написать сюда редирект на страницу успешного заказа

        # if condition
        #   html = render_to_string(template: 'orders/_online_payment.html.erb',
        #          formats: ["html"], layout: false,
        #          locals: {order: @order})
        # else
        #   html = render_to_string(template: 'orders/_offline_payment.html.erb',
        #          formats: ["html"], layout: false,
        #          locals: {order: @order}) 
        # end
        
        # format.json { render json: { html: html }, layout: false } 


        format.html { redirect_to root_path, :flash => { success: 'Заказ успешно оформлен' } }
        format.json { render :show, status: :ok, location: @order }
      else
        # @cart = current_cart
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order,  :flash => { success: "Ваш заказ успешно обновлен"}  }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, :flash => { danger: "Заказ удален"} }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:user_id, :name, :email, :telephone, :city, :street, :house, :housing, :flat, :shipment_method_id, :payment_method_id, :accept_rules, :comment)
    end
end
